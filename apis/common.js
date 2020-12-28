/**
 * Get 请求，参数可选
 */
export function testGet($axios, data) {
  return $axios.$get('http://icanhazip.com', { params: data })
}
