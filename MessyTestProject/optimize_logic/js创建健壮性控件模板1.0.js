cc.Class({
	setCtorParams:function(){
		// (this.initData || this.initUI); // 以下简称this.initSelf()
		if(!this.init){
			this.initSelf()
		}

		this.refresh();
	},
	onLoad:function(){
		if(!this.init){
			this.initSelf();
		}

		this.refresh();
	},
	initSelf:function(){
		// 创建默认数据组
		this.init = true;

		this.requestServer();
	},
	refresh:function(){
		if(!this.init){
			this.initSelf()
		}

		// 根据服务器数据进行数据更新
	},
	requestServer:function(){
		this.dealServerData();
		this.refresh();

		// 根据情况进行回调
	},
	dealServerData:function(){
		// 处理服务器数据
	}
})