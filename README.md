# README

RageRb API experiment

### Current Load testing Run

```
 group= iter=110 request_id=47fa13b1-b987-4701-6c73-3acff349a883 scenario=default source=http-debug vu=2

     ✓ List Articles - Status is 200
     ✓ List Comments - Status is 200

     checks.........................: 100.00% 8404 out of 8404
     data_received..................: 28 MB   235 kB/s
     data_sent......................: 819 kB  6.8 kB/s
     http_req_blocked...............: avg=3.3µs   min=0s      med=1µs     max=714µs    p(90)=3µs     p(95)=4µs
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=570µs    p(90)=0s      p(95)=0s
   ✓ http_req_duration..............: avg=40.18ms min=19.51ms med=31.52ms max=229.14ms p(90)=66.9ms  p(95)=81.73ms
       { expected_response:true }...: avg=40.18ms min=19.51ms med=31.52ms max=229.14ms p(90)=66.9ms  p(95)=81.73ms
   ✓ http_req_failed................: 0.00%   0 out of 8404
     http_req_receiving.............: avg=85.48µs min=27µs    med=75µs    max=966µs    p(90)=136µs   p(95)=156µs
     http_req_sending...............: avg=4.67µs  min=1µs     med=4µs     max=177µs    p(90)=8µs     p(95)=11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s
     http_req_waiting...............: avg=40.09ms min=19.47ms med=31.42ms max=228.99ms p(90)=66.82ms p(95)=81.62ms
     http_reqs......................: 8404    69.948185/s
     iteration_duration.............: avg=1.08s   min=1.04s   med=1.06s   max=1.43s    p(90)=1.12s   p(95)=1.15s
     iterations.....................: 4202    34.974093/s
     vus............................: 2       min=2            max=50
     vus_max........................: 50      min=50           max=50
```
