-- interesting query that shows the posts where trolls interacted with other trolls
select *		
from (
select sus_user_comments.author as com_auth, comment_body, link_id, title, sus_user_posts.author as post_auth, sus_user_posts.subreddit as subreddit
from sus_user_comments 
left join sus_user_posts on link_id=id
where link_id in (select id from sus_user_posts) 
order by link_id desc
) as foo 
where post_auth != com_auth	
--  from the above, this is the most common combination of troll interactions
    select concat(post_auth, '------', com_auth) as concat, count(*)
    from (
    select sus_user_comments.author as com_auth, comment_body, link_id, title, sus_user_posts.author as post_auth, sus_user_posts.subreddit as subreddit
    from sus_user_comments 
    left join sus_user_posts on link_id=id
    where link_id in (select id from sus_user_posts) 
    order by link_id desc
    ) as foo 
    where post_auth != com_auth			
    group by concat
    order by count(*) desc

-- ideal training data for newest ML
-- union of all sus_user_posts and norm_user_posts where the profile of sus posts is similar to norm posts (instead of just LIMIT [num of sus_posts])
--even better would be a matching number of norm_posts to each sus_post subreddit
--so like, sus posts has 5 posts, 2 from funny and 3 from awe, then so would norm posts