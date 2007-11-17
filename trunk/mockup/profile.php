<? require('header.php') ?>

<style>
	label {
		display: block;
		float: left;
		width: 150px;
	}
	
	div.left_column {
	  margin-right: 50px;
		float: left;
	}
</style>

<h1>My Profile</h1>

<div class="box">
	<div class="left_column">
	<form>
		<label>Company Name:</label>
		<input type="text" />
		<br />
		
		<label>Address:</label>
		<input type="text" />
		<br />
		
		<label>Province:</label>
		<input type="text" />
		<br />
		
		<label>Postal Code:</label>
		<input type="text" />
		<br />
		
		<label>Comments:</label>
		<input type="text" />

	</form>
	</div>
	
	<div class="right_column">
		<label>Company Logo:</label>
		<img src="images/di.jpg" />
	</div>
</div>

<? require('footer.php') ?>