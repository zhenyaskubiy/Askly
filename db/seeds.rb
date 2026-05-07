users_data = [
  { email: "asfar@example.com", name: "Asfar Khan", nickname: "asfar", password: "password123" },
  { email: "charmano@example.com", name: "Char Mano", nickname: "charmano", password: "password123" },
  { email: "rourtley@example.com", name: "Rour Tley", nickname: "rourtley", password: "password123" }
]

users = users_data.map do |attrs|
  User.find_or_create_by!(email: attrs[:email]) do |u|
    u.name = attrs[:name]
    u.nickname = attrs[:nickname]
    u.password = attrs[:password]
  end
end

questions_data = [
  {
    title: "Implementing JWT in Next.js 14?",
    body: "How do I implement JWT authentication in Next.js 14 with App Router? I want to handle refresh tokens properly and keep session state.",
    tags: "NextJS, JWT, Authentication",
    user: users[0]
  },
  {
    title: "Optimizing high-traffic PostgreSQL queries for SaaS apps",
    body: "We're seeing slow query times on our SaaS platform under heavy load. Our PostgreSQL instance handles ~10k queries/min. What are the best indexing strategies?",
    tags: "NextJS, Postgres, Performance",
    user: users[0]
  },
  {
    title: "Implementing webstage and smart caching",
    body: "Looking for best practices to implement service workers and smart caching strategies for a PWA with dynamic content.",
    tags: "React, Tailwind, PWA",
    user: users[1]
  },
  {
    title: "Remoted one Software industry challenges",
    body: "What are the biggest challenges when transitioning a fully on-site team to remote-first? Looking for tooling and workflow recommendations.",
    tags: "DevOps, SaaS, Remote",
    user: users[2]
  },
  {
    title: "Best practices for React Server Components in 2025?",
    body: "I'm building a large-scale dashboard with React Server Components. How do I handle data mutations and avoid unnecessary client bundles?",
    tags: "React, NextJS, Performance",
    user: users[1]
  },
  {
    title: "Optimizing the notification system for real-time apps",
    body: "What's the best approach for real-time notifications - WebSockets, SSE, or polling? I need to support 100k concurrent users.",
    tags: "NextJS, Postgres, Performance",
    user: users[2]
  }
]

questions_data.each do |attrs|
  Question.find_or_create_by!(title: attrs[:title]) do |q|
    q.body = attrs[:body]
    q.tags = attrs[:tags]
    q.user = attrs[:user]
  end
end

puts "Seeded #{User.count} users and #{Question.count} questions."
