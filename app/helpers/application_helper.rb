module ApplicationHelper
  def embedded_svg(filename, options = {})
    assets = Rails.application.assets
    asset = assets.find_asset(filename)

    if asset
      file = asset.source.force_encoding('UTF-8')
      doc = Nokogiri::HTML::DocumentFragment.parse file
      svg = doc.at_css 'svg'
      svg['class'] = options[:class] if options[:class].present?
    else
      doc = "<!== SVG #{filename} not found -->"
    end

    # rubocop:disable Rails/OutputSafety
    raw doc
    # rubocop:enable Rails/OutputSafety
  end

  def default_meta_tags
    {
      site: 'DTweet',
      title: 'DTweet',
      reverse: true,
      separator: '|',
      description: 'Let’s use Twitter to its maximum utility with Dtweet’s Tweet scheduler and automation tool. Gain more engagement every time you post.',
      keywords: 'tweet, twitter, scheduler, tweet-scheduler, scheduled_tweet',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.png') }
      ],
      og: {
        site_name: 'DTweet',
        title: 'DTweet',
        description: 'Let’s use Twitter to its maximum utility with DTweet’s Tweet scheduler and automation tool. Gain more engagement every time you post.',
        type: 'website',
        url: request.original_url
      }
    }
  end
end
