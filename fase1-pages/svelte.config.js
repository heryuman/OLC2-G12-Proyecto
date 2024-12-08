import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: vitePreprocess(),
	kit: {
		adapter: adapter(),
		paths: {
			base: process.env.BASE_PATH || '', 
		},
		prerender: {
			// Importante para GitHub Pages
			handleHttpError: 'warn',
		},
	},
};

export default config;
