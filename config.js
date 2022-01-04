const config = {
  gatsby: {
    pathPrefix: '/app_movilidad',
    siteUrl: 'https://dflasso.github.io/',
    gaTrackingId: null,
    trailingSlash: false,
  },
  header: {
    logo: 'https://lh3.googleusercontent.com/proxy/lZR1uHthIuzhp19Q9V-cHejbGT7tgs5zWbKBrmEONk2t-AGeFCQLTGhlglMVN41oSeJrcBCw4qTo9SXpUK5cutdmHlm9OXK2-nJnOBXPNHpPs7LX4ihituTPwBwQdHg8ZBoS4GFWrP_yWW7zn9-16_EqG9dhWxizuCFNDhwOjmnIy58e6NxKNxac81xVVl6k0t5-v_dUYQfTSm5V3r-fNIQJeQrOG4OcKTeVmTzYRi1WZZ1SX3RUWqr77l-zhB3pMCefkssWb-eKAGzLQzrPl9exGuvU',
    logoLink: 'https://dflasso.github.io/',
    title:
      "<a href='https://github.com/dflasso/app_movilidad'><img class='img-responsive' src='https://graphql-engine-cdn.hasura.io/learn-hasura/assets/homepage/learn-logo.svg' alt='Learn logo' /></a>",
    githubUrl: 'https://github.com/dflasso/app_movilidad',
    helpUrl: '',
    tweetText: '',
    social: `<li>
		    <a href="https://twitter.com/dany_f_lasso" target="_blank" rel="noopener">
		      <div class="twitterBtn">
		        <img src='https://graphql-engine-cdn.hasura.io/learn-hasura/assets/homepage/twitter-brands-block.svg' alt={'Twitter'}/>
		      </div>
		    </a>
		  </li>
			<li>
		    <a href="https://www.linkedin.com/in/dany-lasso-10683b124/" target="_blank" rel="noopener">
		      <div class="discordBtn">
		        <img src='https://cdn-icons-png.flaticon.com/512/174/174857.png' alt={'Linkedin'}/>
		      </div>
		    </a>
		  </li>`,
    links: [{ text: '', link: '' }],
    search: {
      enabled: false,
      indexName: '',
      algoliaAppId: process.env.GATSBY_ALGOLIA_APP_ID,
      algoliaSearchKey: process.env.GATSBY_ALGOLIA_SEARCH_KEY,
      algoliaAdminKey: process.env.ALGOLIA_ADMIN_KEY,
    },
  },
  sidebar: {
    forcedNavOrder: [
      '/introduction', // add trailing slash if enabled above
      '/feactures',
      '/About',
    ],
    collapsedNav: [
      '/codeblock', // add trailing slash if enabled above
    ],
    links: [{ text: 'Dany Lasso', link: 'https://dflasso.github.io/' }],
    frontline: false,
    ignoreIndex: true,
    title:
      "<a href='https://github.com/dflasso/app_movilidad'>App Movilidad - ESPE </a><div class='greenCircle'></div>",
  },
  siteMetadata: {
    title: 'App Movilidad - ESPE | Dany Lasso',
    description: 'Documentation of application movil with flutter SDK and Arcgis  ',
    ogImage: null,
    docsLocation: 'https://github.com/dflasso/app_movilidad',
    favicon: 'https://graphql-engine-cdn.hasura.io/img/hasura_icon_black.svg',
  },
  pwa: {
    enabled: false, // disabling this will also remove the existing service worker.
    manifest: {
      name: 'Gatsby Gitbook Starter',
      short_name: 'GitbookStarter',
      start_url: '/',
      background_color: '#6b37bf',
      theme_color: '#6b37bf',
      display: 'standalone',
      crossOrigin: 'use-credentials',
      icons: [
        {
          src: 'src/pwa-512.png',
          sizes: `512x512`,
          type: `image/png`,
        },
      ],
    },
  },
};

module.exports = config;
