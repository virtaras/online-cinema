<div class="filters">
	<div class="filter" data-filter-name="with_genres">
		<?$genres=sql_arr("SELECT tmdb_genres.* FROM tmdb_genres");
		foreach($genres as $genre){?>
		<a class="checkbox" data-filter-value="<?=$genre["tmdb_id"]?>"><?=$genre["name"]?></a>
		<?}?>
	</div>
	<div class="filter" data-filter-name="year">
		<input id="year" type="text" placeholder="year" />
	</div>
	<a id="reload_movies">reload_movies</a>
</div>