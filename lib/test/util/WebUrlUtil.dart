class WebUrlUtil{

  static  final String html1 = '''
<!DOCTYPE html><html>
<head>
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" id="viewport" name="viewport">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Navigation Delegate Example</title>
</head>
<body>
''';
  static final String html3 = '</body></html>';

  static final String html2 = "<style> img{width:90%;}</style><p>　　二级建造师考试结束后，考生比较关心的问题莫过于考试成绩和分数线了。据了解，历年二级建造师成绩查询时间会在考试结束后2-3个月，而2018年二级建造师分数线公布时间会与成绩查询时间是否一致呢？今天，优路教育就为大家解答一下。</p><p style=\"text-align:center\"><img  src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3256594511,1617896907&fm=173&app=25&f=JPG?w=218&h=146&s=520BB944CE48055755C24C9A0300909F\" title=\"二建分数线公布时间\" alt=\"二建分数线公布时间\" width=\"546\" height=\"293\" border=\"0\" vspace=\"0\" style=\"width: 546px; height: 293px;\"/></p><p>　　根据以往二级建造师考试成绩及合格线公布时间，预计2018年二级建造师考试成绩查询入口及分数线将在考后2-3个月左右陆续开通，也就是7月下旬至8月初期间。大部分省份二级建造师考试成绩和分数线都是同时公布的，只有小部分省份分数线会延后一点。优路教育会密切关注2018年各省二级建造师成绩查询相关信息并及时更新，考生们可以持续关注优路教育二级建造师频道。</p><p>　　<strong>考生在等候二级考试成绩公布的同时还需要关注以下问题：</strong></p><p>　　<strong>二建考后审核地区和需社保地区：</strong></p><p>　　2018年二级建造师需要社保的省份：上海、江西、湖南、江苏、安徽、吉林、福建;</p><p>　　2018年二级建造师考后审核的省份：山西、陕西、广东、河南、福建、湖南、重庆、西藏，考试成绩合格的考生审还要审核通过，才能拿到二建证书。</p><p>　　<strong>注册证书</strong></p><p>　　二级建造师执业资格注册有效期一般为3年，有效期满前3个月，持证者应到原注册管理机构办理再次注册手续。在注册有效期内，变更执业单位者，应当及时办理变更手续。</p><p>　　<strong>证书领取</strong></p><p>　　二级建造考试合格并通过审核后，考生需携带相关材料在规定时间内到各报名点办理二建执业资格证书。</p>";
  static initUrl(){
    return html1+html2+html3;
  }


}