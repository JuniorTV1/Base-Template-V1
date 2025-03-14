
INSERT INTO ox inventory -> data->items.lua 

["wood_plank"] = {
		label = "Planches de bois",
		weight = 1,
		stack = true,
		close = true,
	},
	["tree_bark"] = {
		label = "Ecorce d'arbre",
		weight = 1,
		stack = true,
		close = true,
	},
	["tree_lumber"] = {
		label = "Buches de bois",
		weight = 1,
		stack = true,
		close = true,
	},

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
  (1000, 'lumberjack', 0, 'Bûcheron', 'Travailleur', 0, '', '');


INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
      ('lumberjack', 'Bûcheron', 1);
