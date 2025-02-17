defmodule Changelog.Slack.Messages do
  alias ChangelogWeb.{NewsItemView, EpisodeView}

  def new_comment(comment) do
    ~s"""
    New comment by *#{comment.author.name}* on _#{comment.news_item.headline}_ https://changelog.com/news/#{NewsItemView.hashid(comment.news_item)}
    """
  end

  def new_episode(episode) do
    ~s"""
    #{EpisodeView.title_with_podcast_aside(episode)} #{celebrate_emoji()} #{EpisodeView.share_url(episode)}
    """
  end

  def welcome do
    ~s"""
    Welcome to Changelog's Community Slack! :clap:

    This is an inclusive place where we chat about tech, life, our shows, or just whatever. *There are no imposters here*. By hanging out in this Slack, you are agreeing to abide by our Code of Conduct: https://changelog.com/coc

    You are welcome to join any channel. Each podcast has one (<#C1YNE3WUX|jsparty>, <#CAACWA9FE|practicalai>, <#C02308JMSFM|shipit>) and some are used for internal Changelog stuff (<#C03SA8VE2|dev>). Feel free to explore!

    When you get a moment, please introduce yourself in <#C024Q4CER|main>. Tell us where you're from, what you're up to, how you found this community, why you joined, and/or anything else about yourself you'd like us to know!

    Oh, and before you go... *here's our Slack color theme*

    #121921,#171f29,#61c192,#FFFFFF,#232f3f,#FFFFFF,#61c192,#61C192

    :green_heart:
    """
  end

  defp celebrate_emoji,
    do: ~w(:tada: :gift: :muscle: :raised_hands: :parrot: :dancer:) |> Enum.random()
end
