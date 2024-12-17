

postfix-alias
==============

run postfix as a relay with aliases for incoming mail


## Usage


```
git clone https://github.com/vit/postfix_alias.git
cd postfix_alias

mkdir .secrets

cat >> .secrets/mydestination <<EOF
example1.com
EOF

cat >> .secrets/virtual <<EOF
user_1@example1.com   me@example2.com
user_2@example1.com   her@example3.com
EOF

make build
make run
```


### Don't forget to add a MX record to your DNS server

```
example1.com.	10000	IN		MX		10         example1.com.
```
(or something like that)


