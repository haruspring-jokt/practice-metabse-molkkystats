-- 形式ごと基本データ
select
    cate 種類,
    count(*) ゲーム数,
    sum(shot_count) 投擲数,
    sum(ace_count) エース数,
    sum(ace_count) / sum(shot_count) エース率,
    sum(mistake_count) ミス数,
    sum(mistake_count) / sum(shot_count) ミス率,
    sum(lob_ace_count) / sum(lob_shot_count) フワリエース率,
    sum(vertical_ace_count) / sum(vertical_shot_count) 縦エース率,
    sum(back_ace_count) / sum(back_shot_count) 裏エース率,
    sum(step_ace_count) / sum(step_shot_count) ステップエース率,
    sum(attempt_ace_count) / sum(attempt_shot_count) 決定率,
    avg(finished_turn) 平均ターン数
from
    games g
    left outer join color c on g.color = c.color
group by
    g.cate



-- 重さごとブレイク平均
select
    c.weight 重さ,
    avg(FIRST_SHOT_SCORE) ブレイク平均
from
    games g
    left outer join color c on g.color = c.color
where
    FIRST_SHOT_SCORE IS NOT NULL
group by
    c.weight



-- 最近20ゲーム
select
    sum(shot_count) 投擲数,
    sum(ace_count) エース数,
    sum(ace_count) / sum(shot_count) エース率,
    sum(mistake_count) ミス数,
    sum(mistake_count) / sum(shot_count) ミス率,
    sum(lob_ace_count) / sum(lob_shot_count) フワリエース率,
    sum(vertical_ace_count) / sum(vertical_shot_count) 縦エース率,
    sum(back_ace_count) / sum(back_shot_count) 裏エース率,
    sum(step_ace_count) / sum(step_shot_count) ステップエース率,
    sum(attempt_ace_count) / sum(attempt_shot_count) 決定率,
    avg(finished_turn) 平均ターン数
from
    (
        select
            *
        from
            games
        order by
            id desc
        limit
            20
    ) as subt;