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
    first_shot_score INT,
    finished_turn INT,
    three_mistake_count INT,
    fifty_over_count INT,
    vertical_shot_count INT,
    vertical_ace_count INT,
    back_shot_count INT,
    back_ace_count INT,
    comment VARCHAR(1000),
    won_team_num INT,
    photo_url VARCHAR(1000),
    PRIMARY KEY (id)
);