var vue = require("vue");
var router = require("vue-router");
var resource = require("vue-resource");
require('./views/style.css');

var home  = require('./vue/home.vue');
var about = require('./vue/about.vue');
var app = require('./vue/app.vue')
vue.use(router);
vue.use(resource);

var route = new router({
	hashbang : false,
	history : false,
	saveScrollPosition: true,
	transitionOnLoad : true,
	transition:true,
	transitionMode: 'out-in'
});

route.map({
	'/home':{
		component: home
	},
	'/about':{
		component: about
	}
});

route.redirect({
    '*': '/home'
})

route.afterEach(function(transition){
	console.log("成功浏览到：" + transition.to.path)
})

route.start(app,"#app");