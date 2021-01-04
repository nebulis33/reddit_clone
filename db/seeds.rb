# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


b = User.create(email: "brooke@email.net", username: 'Brooke', password: 'burrito')
c = User.create(email: "claire@email.net", username: 'Claire', password: 'mounttamhikes')
s = User.create(email: "scott@email.net", username: 'Scott', password: 'handshakes')
q = User.create(email: "quinn@email.net", username: 'Quinn', password: 'dumbledore')

s1 = Sub.create(title: 'App Academy Drama', description: 'Staff Secrets', moderator_id: c.id)
s2 = Sub.create(title: 'Dogs', description: 'Worse than cats (TM)', moderator_id: s.id)
s3 = Sub.create(title: 'Food', description: 'Always hungry.', moderator_id: q.id)

p1 = Post.create(title: 'Who stole my lunch?', author_id: b.id, content: 'No seriously, guys, where is it?', sub_ids:[s1.id,s3.id])
p2 = Post.create(title: 'Reggie the Reject Bear: MISSING', author_id: c.id, content: 'Discovered at 12:35am this morning.', sub_ids:[s1.id])
p3 = Post.create(title: 'Newfoundland/Daschund friendship', author_id: q.id, content: 'Thoughts?', sub_ids: [s2.id])
p4 = Post.create(title: 'Cookies', author_id: s.id, content: 'These are so good! \n http://allrecipes.com/recipe/11032/oatmeal-craisin-cookies/?scale=12&ismetric=0', sub_ids: [s3.id])
p5 = Post.create(title: 'Curry Up Now', author_id: b.id, content: 'Aloo Gobi Burrito forever <3', sub_ids: [s1.id])