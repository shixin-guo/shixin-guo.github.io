---
title: 相比于flux redux 好在哪里
date: 2017-07-31 16:55:16
tags: react redux flux
toc: true
---

# 
## 问题描述
近年来，Redux越来越火，基本上成了React项目的标配。而店铺统计一直还用的是Flux，所以我们准备逐步地从flux切换到redux。不过在引入Redux之前，需要看看它到底好在哪里。

## 问题解答

[Dan Abramov（redux的作者）](https://stackoverflow.com/users/458193/dan-abramov)在stack overflow上有详细地回答 [Why use Redux over Facebook Flux](https://stackoverflow.com/questions/32461229/why-use-redux-over-facebook-flux)。不过，单从店铺统计这个项目来看，引入redux后，有什么好处呢？下面从store，action creator和component这三个方面来细说。

### 1. store
从store这面来看，引入Redux可以带来如下几个优点：

 1. 减少boilerplate代码
 2. 避免反模式（anti-parttern）
 3. 分离派生数据（derived data），降低store层的复杂度
 4. 避免Store之间相互耦合所引入的复杂度
 5. 便于写单测

#### 1.1 减少boilerplate代码

用Flux写的Store对象，需要写许多boilerplate代码，如下所示，写一个简单的chartDataStore：

```
/**
 * @file chartDataStore.js
 */
import AppDispatcher from 'src/dispatcher/AppDispatcher';
import {EventEmitter} from 'events';
import Constants from 'src/constants/Constants';
const CHANGE_EVENT = 'change';
let storeData = {
    chartData: {}
};
let chartDataStore = Object.assign({}, EventEmitter.prototype, {
    getStoreData() {
        return storeData;
    },
    addChangeListener(callback) {
        this.on(CHANGE_EVENT, callback);
    },
    removeChangeListener(callback) {
        this.removeListener(CHANGE_EVENT, callback);
    },
    emitChange() {
        this.emit(CHANGE_EVENT);
    },
    loadChartData(payload) {
        storeData = {
		    ...storeData,
	        chartData: payload.chartData
        };
    }
});

todoListStore.dispatchToken = AppDispatcher.register(function (action) {
    switch (action.actionType) {
        case Constants.CHART_DATA_LOADED:
            chartDataStore.loadChartData(action.payload);
            chartDataStore.emitChange();
            break;
        default:
            break;
    }
});

export default chartDataStore;
```
我们做了好几件事情，创建一个Store对象，“继承”EventEmitter的方法，赋予通用接口(getStoreData, addEventListener等)，然后再注册到AppDispatcher监听关心的事件。
如果是Redux，则可以这样写：
```
import {createStore} from 'redux';
import Constants from 'src/constants/Constants';

function rootReducer(state = {}, action) {
	switch(action.type) {
		case Constants.CHART_DATA_LOADED:
			return {
				chartData: action.payload.chartData
			};
		default: 
			return state;
	}
}

export default createStore(rootReducer);
```
在Redux这边，我们只需要写一个reducer，然后传给createStore即可创建一个Store。Redux的Store有一个getState()方法，对应我们以前给Flux写的getStoreData，同时也支持subscribe方法，订阅Store数据变化的事件，具体使用方法见官网文档[Store](http://redux.js.org/docs/api/Store.html)。

因为Redux只有一个Store，所以对应flux的多个Store，Redux这边只需要写多个reducer即可。举个例子，我们现在有两个flux Store，chartDataStore和tableDataStore，在Redux这边我们只需要写两个reducer，然后组合一下即可：
```
import {createStore, combineReducers} from 'redux';
import Constants from 'src/constants/Constants';

function chartData(state = {}, action) {
	switch(action.type) {
		case Constants.CHART_DATA_LOADED:
			return action.payload.chartData;
		default: 
			return state;
	}
}
function tableData(state = {}, action) {
	switch(action.type) {
		case Constants.TABLE_DATA_LOADED:
			return action.payload.tableData;
		default: 
			return state;
	}
}

const rootReducer = combineReducers({
	chartData,
	tableData
});

export default createStore(rootReducer);
```
可以看到，引入Redux后，代码的确简洁了不少。

#### 1.2 避免反模式(anti-parttern)
Flux建议的架构是[这样的](https://github.com/facebook/flux)：

![图片](http://bos.nj.bpc.baidu.com/v1/agroup/714dce73f637d81b1054f5bf03754b098b834b5b)

但Flux只是提出了一个架构方案，并没有实际的框架来限制大家应该怎样写代码。如果我们对这个架构理解得不到位，或者为了方便快速地实现一些功能，常常会写出一些违反架构约定的反模式(anti-pattern)，比如：

- 直接在Store中调用web api(如ajax、location等)；
- 或者直接在Store中dispatch action。

Redux这边通过引入`reducer必须纯函数`这一强制约束，可以有效地避免上面这些反模式的出现。`因为reducer必须是纯函数，在纯函数中并不允许出现上面这些带副作用（side effect）的反模式代码`。

#### 1.3 分离派生数据（derived data），降低store层的复杂度
##### 1.3.1 Flux怎么做？
在Flux中我们一般有两种计算派生数据的方式：1）写select方法；2）新建一个Store。
举个例子，比如我们有一个todoListStore，里面存储所有的todo列表。如果想要得到已完成的列表，采用方法1，我们可以在Store上添加一个方法getFinishedList()：
```
/**
 * @file todoListStore.js
 */
...

let storeData = {
    todoList: []
};
let todoListStore = Object.assign({}, EventEmitter.prototype, {
    getStoreData() {
        return storeData;
    },
    getFinishedList() {
	    return storeData.todoList.filter(todo => todo.finished);
    },
	...
});

function toggleTodo(payload) {
	...
}

Store.dispatchToken = AppDispatcher.register(function (action) {
    switch (action.actionType) {
        case Constants.TOGGLE_TODO:
            toggleTodo(action.payload);
            todoListStore.emitChange();
            break;
	    ...
        default:
            break;
    }
});
...
```
我们也可以采用方法2，新建一个finishedListStore，用来缓存已完成的列表：
```
/**
 * @file finishedListStore.js
 */
import TodoListStore from './TodoListStore';
//省略无关代码
...
let storeData =  {
	finishedList: []
};
updateFinishedList();
let finishedListStore = Object.assign({}, EventEmitter.prototype, {
    getStoreData() {
        return storeData;
    },
	...
});

function updateFinishedList() {
	storeData = {
		finishedList: TodoListStore.getStoreData().todoList.filter(todo => todo.finished);	
	};
}

Store.dispatchToken = AppDispatcher.register(function (action) {
    switch (action.actionType) {
        case Constants.TOGGLE_TODO:
	        AppDispatcher.waitFor([TodoListStore.dispatchToken])
            updateFinishedList();
            finishedListStore.emitChange();
            break;
	    ...
        default:
            break;
    }
});
...
```
相比于方法1，方法2显得比较麻烦，但它能把计算结果缓存下来，这样可以保证在数据不变的情况下返回同一个对象。
但无论方法1还是方法2，派生数据的逻辑都与原始数据耦合在了Store里。
##### 1.3.2 Redux怎么做？
在Redux这边，创建Store只需要写reducer就行，并没有写select函数的地方。仿照上面的方法2，我们也可以写一个finishedListReducer来存储已完成的列表，但在redux这边有更好的解决方案。
参见官方文档[Computing Derived Data](http://redux.js.org/docs/recipes/ComputingDerivedData.html)，我们可以利用[reselect](https://github.com/reactjs/reselect)这个库来写个getFinishedListSelector。
```
/**
 * getFinishedListSelector.js
 */
import { createSelector } from 'reselect'；
const getTodoList = state => state.todoList;
export default createSelector(getTodoList, todoList => {
	return todoList.filter(todo => todo.finished);
});
```
reslect创建的selector自带缓存功能，可以达到上述方法2相同的效果。也就是只要原生数据不变，每次调用getFinishedListSelector返回都是同一个缓存对象，并不会重复计算。这既节省了计算资源，也可以避免React控件重复渲染。

##### 1.3.3 小结
可以看到，在redux这边，派生数据单独写到了selector中，与store层分离。这样既可以降低store层的复杂度，也能帮助捋清原生数据和派生数据之间的关系，写出更高质量的代码。

#### 1.4 避免Store之间互相耦合所引入的复杂度
flux中的Store之间常常会存在相互依赖的情况，而这种依赖关系出现的根本原因还是派生数据。只要是派生数据，就一定会与对应的原生数据有依赖关系。

下面我们来详细分析一下这种依赖关系，都有哪些可能的情况。从表面上来看，如果一个StoreA依赖于StoreB，主要还是因为StoreA中的某段业务逻辑需要StoreB的数据。我们知道，Store的核心就是它的数据，而那些业务逻辑也都是与这些数据紧密相关的。仔细想一下，我们可以将这些业务逻辑分成三类： 1. 初始化逻辑； 2. 响应逻辑； 3. 展示逻辑。

`初始化逻辑`负责在加载Store时，设置StoreA的初始数据状态。如果这部分逻辑直接依赖了StoreB的数据，那么说明StoreA的部分数据其实是由StoreB的数据决定的，这部分数据应该算是StoreB的派生数据。

`响应逻辑`负责响应事件，即有action到来时，由Store的响应逻辑来决定如何更新其数据状态。如果这部分逻辑直接依赖了StoreB，同样说明StoreA的部分数据实际上是StoreB的派生数据。

`展示逻辑`其实对应了Store的select方法，主要负责加工StoreA的数据，生成派生数据。如果这部分逻辑也依赖StoreB的数据，那么说明这个select方法产生派生数据其实同时依赖于StoreA和StoreB。所以StoreA其实没有必要依赖StoreB，我们完全可以将这部分展示逻辑从StoreA中拿出去。

所以只要存在上面三种情况的任意一种，StoreA就需要依赖StoreB了。而这种依赖关系的根本就是因为存在了派生数据。在1.3小节我们已经讨论过，在Redux这边，派生数据都可以被分离到相应的selector中去，从而避免了Flux这边Store之间复杂的耦合关系。

#### 1.5 便于写单测
这个就很明显了，Redux这边的Store层被简化到只剩下纯函数。对纯函数的测试就非常简单了，只需要提供输入，然后验证输出即可。根本不需要面对Flux那边各个Store的复杂依赖关系，以及可能出现的反模式。

### 2. action creator
action creator这边，引入Redux后，可以拿掉原来对Store和AppDispatcher对象的依赖，从而降低写单测的难度。

不同于Flux，Redux这边的action creator不直接依赖Store对象，更没有独立AppDispatcher可以使用。如果需要在action creator中获取Store的状态，或者发布 action，可以参考[async-action-creator](http://redux.js.org/docs/advanced/AsyncActions.html#async-action-creators)，借助[redux-thunk](https://github.com/gaearon/redux-thunk)来动态注入dispatch和getState方法。dispatch和getState都是redux store的方法，前者用于向store发布action，后者用于获取Store的状态。

下面拿店铺统计的代码举个例子，想要获取店铺的“整体概览”数据，我们有这样一个action creator方法：
```
import Constants from 'src/constants/Constants';
import AppDispatcher from 'src/dispatcher/AppDispatcher';
import api from 'src/webAPIUtils/overview';
import OverviewStore from 'src/stores/console/overview/OverviewStore';

export function getOverview(params) {
    let context = OverviewStore.getTableContext(params);

    return api.getOverview(context, function onSuccess(data) {
        AppDispatcher.dispatch({
            actionType: Constants.OVERVIEW_LOADED,
            params: {data}
        });
    });
}
```
如果采用redux的话，就可以这样写:
```
import Constants from 'src/constants/Constants';
import api from 'src/webAPIUtils/overview';
import getOverviewTableContext from 'src/selectors/getOverviewTableContext';

export function getOverview(params) {
	return function(dispatch, getState) {
		let state = getState();
		let context = getOverviewTableContext(state);

		return api.getOverview(context, function onSuccess(data) {
            dispatch({
                actionType: Constants.OVERVIEW_LOADED,
                params: {data}
            });
        });
	};
}
```

所以，引入redux之后，action creator里的逻辑无需太大的变化，但可以拿掉对Dispatcher和Store的直接依赖。总之，拿掉的依赖越多，测试起来就越简单一些。

### 3. component
从component这面来看，在店铺统计现有的代码引入Redux的话，能带来如下好处：

 1. 减少boilerplate代码
 2. 便于写单测


首先需要普及两个基本的概念：[Container Component](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)和[Presentational Component](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)。他俩最明显的区别就是，Presentaional Component只管渲染界面和响应用户事件，对action，store等无感知。而Container Component则负责监听Store事件，从Store中拿数据，并向store层发布action。

所以，引入redux的话，原项目中的Presentational Component并不受影响，该怎么写还是怎么写。而对于Container Component，则毕竟需要从Flux的store和action creator切换到redux。官网文档[Usage with React](http://redux.js.org/docs/basics/UsageWithReact.html)有详细介绍Redux如何搭配React使用。通过借助[react-redux](https://github.com/reactjs/react-redux)这个热门的库，我们可以少写许多boilerplate代码。继续以之前的“整体概览”为例，在Flux这边，我们的Overview控件是这样写的：
```
/*
 * @file Overview.js
 */
...
import OverviewActionCreators from 'src/actions/console/OverviewActionCreators';
import OverviewStore from 'src/stores/console/overview/OverviewStore';

function getStateFromStores(props) {
    return OverviewStore.getStoreData();
}

export default class Overview extends Component {
    constructor(...args) {
        super(...args);
        this.state = getStateFromStores(this.props);

        ...
        this.listenForChanged = this.listenForChanged.bind(this);
    }

    componentDidMount() {
        OverviewStore.addChangeListener(this.listenForChanged);
        OverviewActionCreators.refresh();
    }

    componentWillUnmount() {
        OverviewStore.removeChangeListener(this.listenForChanged);
    }

    render() {
        return (...);
    }

    listenForChanged() {
        this.setState(getStateFromStores(this.props));
    }
}

```
可以看到，Flux这边的Overview控件需要监听OverviewStore的change事件，更新最新状态到自己的state，同时也会直接用OverviewActionCreators来发布action。

如果是Redux的话，我们可以这样来写OverviewContainer：
```
/**
 * @file OverviewContainer
 */
import {bindActionCreators} from 'redux';
import {connect} from 'react-redux';
import Overview from './Overview';
import * as actionCreators from 'src/actions/newConsole/store/overviewActionCreators';

function mapStateToProps(state) {
    return {
        overview: state.overview
    };
}

function mapDispatchToProps(dispatch) {
    return {
        refresh: bindActionCreators(actionCreators.refresh, dispatch)
    };
}

export default connect(mapStateToProps, mapDispatchToProps)(Overview);

```
而之前Flux的Overview控件可以改成一个更简洁的Presentational Compoent:
```
/*
 * @file Overview.js
 */
...
export default class Overview extends Component {
	...
    componentDidMount() {
        OverviewActionCreators.refresh();
    }

    render() {
	    let overview = this.props.overview;
        return (...);
    }
}

```

可以看到，通过借助[react-redux](https://github.com/reactjs/react-redux)，可以更佳方便地写Container Component，减少许多boilerplate代码。同时，原有的Overview控件被简化成了一个Presentational Component，拿掉了对Store和Action Creator的依赖关系，这就大大降低了为其写单测的难度。