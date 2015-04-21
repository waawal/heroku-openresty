
package = "heroku-openresty"
version = "dev-2"

source = {
	url = "git://github.com/waawal/heroku-openresty.git"
}

description = {
	summary = "OpenResty binaries for running on Heroku with the Lua buildpack",
	license = "MIT"
}

dependencies = {
	"lua >= 5.1"
}

build = {
	type = "command",
	install_command = [[
		LIB_DIR=`cd $(PREFIX)/../../../../; pwd`
		BIN_DIR=`cd $LIB_DIR/../../bin; pwd`
		STACK=${STACK:-cedar}
		cp luajit/lib/libluajit-5.1.so.2.1.0 "$LIB_DIR"
		(
			cd "$LIB_DIR"
			ln -s libluajit-5.1.so.2.1.0 libluajit-5.1.so.2
			ln -s libluajit-5.1.so.2.1.0 libluajit-5.1.so
		)
		cp nginx/sbin/$STACK/nginx "$BIN_DIR"
	]],
	install = {
		bin = {
			"bin/compile_nginx_config.lua",
			"bin/start_nginx.sh"
		},
		lib = {
			["rds.parser"] = "lualib/rds/parser.so",
			["redis.parser"] = "lualib/redis/parser.so",
			["cjson"] = "lualib/cjson.so",
		},
		lua = {
			["resty.aes"] = "lualib/resty/aes.lua",
			["resty.core"] = "lualib/resty/core.lua",
			["resty.core.base"] = "lualib/resty/core/base.lua",
			["resty.core.base64"] = "lualib/resty/core/base64.lua",
			["resty.core.ctx"] = "lualib/resty/core/ctx.lua",
			["resty.core.exit"] = "lualib/resty/core/exit.lua",
			["resty.core.hash"] = "lualib/resty/core/hash.lua",
			["resty.core.misc"] = "lualib/resty/core/misc.lua",
			["resty.core.regex"] = "lualib/resty/core/regex.lua",
			["resty.core.request"] = "lualib/resty/core/request.lua",
			["resty.core.response"] = "lualib/resty/core/response.lua",
			["resty.core.shdict"] = "lualib/resty/core/shdict.lua",
			["resty.core.uri"] = "lualib/resty/core/uri.lua",
			["resty.core.var"] = "lualib/resty/core/var.lua",
			["resty.dns.resolver"] = "lualib/resty/dns/resolver.lua",
			["resty.lock"] = "lualib/resty/lock.lua",
			["resty.md5"] = "lualib/resty/md5.lua",
			["resty.memcached"] = "lualib/resty/memcached.lua",
			["resty.mysql"] = "lualib/resty/mysql.lua",
			["resty.random"] = "lualib/resty/random.lua",
			["resty.redis"] = "lualib/resty/redis.lua",
			["resty.sha"] = "lualib/resty/sha.lua",
			["resty.sha1"] = "lualib/resty/sha1.lua",
			["resty.sha224"] = "lualib/resty/sha224.lua",
			["resty.sha256"] = "lualib/resty/sha256.lua",
			["resty.sha384"] = "lualib/resty/sha384.lua",
			["resty.sha512"] = "lualib/resty/sha512.lua",
			["resty.string"] = "lualib/resty/string.lua",
			["resty.upload"] = "lualib/resty/upload.lua",
			["resty.upstream.healthcheck"] = "lualib/resty/upstream/healthcheck.lua",
			["resty.websocket.client"] = "lualib/resty/websocket/client.lua",
			["resty.websocket.protocol"] = "lualib/resty/websocket/protocol.lua",
			["resty.websocket.server"] = "lualib/resty/websocket/server.lua",
		},
	}
}
