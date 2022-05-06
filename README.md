# reddit_troll_analysis2


Woof, after managing to push my old reddit repo (reddit_troll_analysis1), i'm finally taking a more regimented approach to this.

High level process of what we're working on here:
1. Pull All user data from the Trolls/Bots/Bad-Actors (calling these "bots") from the Reddit API and saving to postgres
2. Pull all user data from non-bot users and save to postgres (i'm not entirely sure of this methodology just yet. the last one had too many users)
3. Train classification model
4. Set up new feed of current reddit posts and classify them as their pulled from the API and save in DB
5. Host results somewhere