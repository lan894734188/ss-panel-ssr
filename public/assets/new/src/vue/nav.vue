<template>
	<div class="nav-view">
		<ul>	
			<li v-link="{path:'/home'}">
				<a href="">首页</a>
			</li>
			<li v-link="{path:'/about'}">
				<a href="">关于</a>
			</li>
		</ul>
	</div>
</template>

<script>

export default{
	name : 'Navbar',

}
</script>

<style lang="sass">
	.nav-view{
		position: fixed;
		top: 0;
		left: 0;
	}
	.nav-view li{
		float: left;
	}
</style>