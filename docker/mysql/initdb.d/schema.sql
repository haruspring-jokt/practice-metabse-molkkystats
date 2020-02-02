CREATE TABLE color (
    id INT NOT NULL,
    color VARCHAR(32) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
    kind VARCHAR(32) NOT NULL,
    `weight` INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE games (
    id INT NOT NULL,
    `date` DATETIME,
    `match` INT,
    teams INT,
    rule VARCHAR(32),
    win_point INT,
    place VARCHAR(128),
    `condition` VARCHAR(32),
    weather VARCHAR(32),
    temperature INT,
    color VARCHAR(32),
    game_num INT,
    shot_count INT,
    ace_count INT,
    mistake_count INT,
    mistake_over INT,
    mistake_short INT,
    mistake_left INT,
    mistake_right INT,
    mistake_irregular INT,
    first_shot_score INT,
    finished_turn INT,
    three_mistake_count INT,
    fifty_over_count INT,
    vertical_shot_count INT,
    vertical_ace_count INT,
    back_shot_count INT,
    back_ace_count INT,
    lob_shot_count INT,
    lob_ace_count INT,
    step_shot_count INT,
    step_ace_count INT,
    attempt_shot_count INT,
    attempt_ace_count INT,
    won_team_num INT,
    photo_url VARCHAR(1000),
    cate VARCHAR(32),
    battle_my_team_num INT,
    battle_my_team_order INT,
    battle_my_team_rank INT,
    comment VARCHAR(1000),
    PRIMARY KEY (id)
);

CREATE TABLE pinpoint (
    id INT NOT NULL,
    `date` DATETIME,
    weather VARCHAR(32),
    `condition` VARCHAR(32),
    color VARCHAR(32),
    350_ace INT,
    350_shot INT,
    450_ace INT,
    450_shot INT,
    500_ace INT,
    500_shot INT,
    650_ace INT,
    650_shot INT,
    800_ace INT,
    800_shot INT,
    950_ace INT,
    950_shot INT,
    comment VARCHAR(1000),
    PRIMARY KEY (id)
);
