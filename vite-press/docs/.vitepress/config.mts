import { defineConfig } from "vitepress"

// https://vitepress.dev/reference/site-config
//
export default defineConfig({
  title: "VitePress",
  description: "A VitePress Site",
  // remove trailing `.html`
  // https://vitepress.dev/guide/routing#generating-clean-url
  cleanUrls: true,
  // Whether to get the last updated timestamp for each page using Git.
  lastUpdated: true,

  markdown: {
    config: (md) => {
      // 使用更多的 Markdown-it 插件！
    },
  },

  themeConfig: {

    search: {
      provider: 'local'
    },

    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Home", link: "/" },
    ],

    sidebar: [
      {
        text: "Examples",
        items: [
          { text: "Markdown Examples", link: "/markdown-examples" },
        ],
      },
    ],

    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/shelken/nix-templates/tree/master/vite-press",
      },
    ],
  },
})
