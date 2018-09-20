// https://raw.githubusercontent.com/ryerh/dev-env/master/pac/pac.js

const PROXY = 'SOCKS5 localhost:1080; DIRECT';
const NO_PROXY = 'DIRECT';

const WHITE_LIST = [

  // local
  /^(10|127|192)\./,
  /^localhost/,

  // domain
  /\.cn$/,

  // sub.domain
  /126.net/,
  /163.com/,
  /360buying.com/,
  /alicdn.com/,
  /alikunlun.com/,
  /aliyun.com/,
  /baidu.com/,
  /bdimg.com/,
  /bdstatic.com/,
  /bootcdn.com/,
  /bootcss.com/,
  /chengzijianzhan.com/,
  /cnblogs.com/,
  /cnzz.com/,
  /coding.net/,
  /csdn.net/,
  /daocloud.io/,
  /dida365.com/,
  /douban.com/,
  /doubanio.com/,
  /fastapi.net/,
  /growingio.com/,
  /henghost.com/,
  /images-cn.ssl-images-amazon.com/,
  /ingageapp.com/,                       // xiaoshouyi.com
  /jd.com/,
  /lagou.com/,
  /nowcoder.com/,
  /processon.com/,
  /qbox.me/,                             // coding.net cdn
  /qingcloud.com/,
  /qq.com/,
  /quqi.com/,
  /ryerh.com/,
  /snssdk.com/,
  /taobao.com/,
  /toutiao.com/,
  /weibo.com/,
  /xiaoshouyi.com/,
  /xsky.com/,
  /ydstatic.com/,
  /yinxiang.com/,
  /youdao.com/,
  /zhihu.com/,
  /zhimg.com/,

];

function FindProxyForURL(url, host) {
  return WHITE_LIST.some(i => i.test(host)) ? NO_PROXY : PROXY;
}
