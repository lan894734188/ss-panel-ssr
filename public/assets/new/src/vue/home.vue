<template>
	<div>
		<div>I am {{ name }}</div>
	</div>
</template>


<script>
//js
export default{
	name: 'home',
	
	data(){
		return{
			name : 'home',
		}
	},
	created(){
		this.$loadingRouteData = false;
		console.log(this.name);
	},

}
</script>

<style>

</style>