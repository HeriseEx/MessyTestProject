cc.Class({
	/*
		参数参考....
	*/
	setCtorParams:function(params){
		// (this.initData || this.initUI); // 以下简称this.initSelf()
		this.dealClientData(params);
		
		if(!this.init){
			this.initSelf()
		}
	},
	onLoad:function(){
		if(!this.isInitRefresh){
		    this.refresh();
		}
	},
	initSelf:function(){
		// 创建默认数据组
		this.init = true;

		// 节点操作历史
		this.step = -1;
		this.stack = new Array();

		this.refresh();
	},
	// 调用此接口进行刷新
	/*
		以下均为可选参数:
		params: 参考 setCtorParams
		isResetData: 是否除了传入数据之外采用默认数据,默认为false
	*/
	refresh:function(params, isResetData){
		this.dealClientData(params, isResetData);

		if(!this.init){
			this.initSelf()
		}

		this.executeStep(++this.step);
		this.dealServerData();
	},
	refreshData:function(){
		// 刷新控件数据以及显示
	},
	requestServer:function(){
		if (!success){
			// 请求失败回滚上一次操作
			this.executeStep(this.stack.pop());
			return;
		}
		// 服务器数据请求成功后才认为是第一次刷新成功
		this.isInitRefresh = true;

		this.dealServerData();
		this.refreshData();
	},
	dealClientData:function(params, isResetData){
		// 处理传入数据
		if (params && isResetData || !this.clientData){
			this.clientData = {};
		}

		// 数据刷新
		if (Object.keys(params).length > 0){
			for (item in params){
				this.clientData[item] = params[item];
			}
		}

		// 整理数据结构
	},
	dealServerData:function(params, isResetData){
		// 处理传入数据
		if (params && isResetData || !this.serverData){
			this.serverData = {};
		}

		// 数据刷新
		if (Object.keys(params).length > 0){
			for (item in params){
				this.serverData[item] = params[item];
			}
		}

		// 整理数据结构
	},
	// 执行操作
	/*
		stepData{
			step, 		-- 操作步骤
			clientData, 		-- 本地数据
			setverData, 		-- 服务器数据
		}
	*/
	executeStep:function(stepData){
		if(typeof(stepData) == "undefined"){
			return;
		}

		// 堆栈管理优化  
		// todo

		this.step = stepData.step;
		this.stack.push(stepData);

		// 执行自定义步骤操作流程
		// todo

		this.dealClientData(stepData.clientData);
		this.dealServerData(stepData.setverData);
		this.refreshData();
	}
})