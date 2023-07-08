import type { APIRoute } from 'astro'

export const post: APIRoute = ({ request, redirect }) => {
  console.log('post route hit')

  return redirect('/cart', 301)
}
