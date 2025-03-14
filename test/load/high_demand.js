import http from 'k6/http';
import { check, sleep } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 50 }, // Ramp up to 50 users over 30 seconds
    { duration: '1m', target: 50 },  // Stay at 50 users for 1 minute
    { duration: '30s', target: 0 },  // Ramp down to 0 users over 30 seconds
  ],
  thresholds: {
    http_req_duration: ['p(95)<500'], // 95% of requests should complete within 500ms
    http_req_failed: ['rate<0.01'],   // Less than 1% of requests should fail
  },
};

export default function () {
  // Test listing all articles
  const articlesResponse = http.get('http://localhost:3000/api/articles');
  check(articlesResponse, {
    'List Articles - Status is 200': (r) => r.status === 200,
  });

  // Test listing comments for a specific article
  const commentsResponse = http.get('http://localhost:3000/api/articles/4/comments');
  check(commentsResponse, {
    'List Comments - Status is 200': (r) => r.status === 200,
  });

  // Simulate think time between requests
  sleep(1);
}
