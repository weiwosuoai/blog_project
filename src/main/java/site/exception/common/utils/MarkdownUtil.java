package site.exception.common.utils;

public class MarkdownUtil {
	
	/**
	 * 将 html 字符串转换成 md 文件字符串
	 * @param htmlStr html 字符串 
	 * @return md 文件字符串
	 */
	public static String htmlStr2MarkdownStr(String htmlStr) {
		String lineSeparator = System.getProperty("line.separator");
		htmlStr = htmlStr.replaceAll("<br>", lineSeparator);
		htmlStr = htmlStr.replaceAll("<p>", "");
		htmlStr = htmlStr.replaceAll("</p>", "");
		htmlStr = htmlStr.replaceAll("&gt;", ">");
		return htmlStr;
	}

	/**
	 * 获取字符串的缩略内容
	 */
	public static String parse2ShortStr(String content) {
		int limit = 200;
		if (content.length() >= limit) {
			content = content.substring(0, limit);
		}
		content = content.replaceAll(">", "").replaceAll("#", "");
		return content.trim() + " ...";
	}
	
	public static void main(String[] args) {
		String htmlStr = "<p>&gt;本文转自 [[http://www.finalshares.com/read-5498](http://www.finalshares.com/read-5498)]([http://www.finalshares.com/read-5498](http://www.finalshares.com/read-5498))<br>&gt;<br>&gt;还在为找不到目标真机发愁，今天在逛 [极分享](http://www.finalshares.com/) 的时候，看到一篇比较好的文章，觉得对我们Android开发作用很大，就转了过来。接下来我们就来看看原文。<br><br>之前用了很久的模拟器，今天给大家分享一个不用模拟器，在没有手机的情况下，如何实现真机 debug 的教程，第一次发教程贴，望支持哈，非喜勿喷哈！<br><br>废话少说，先睹为快。在不用数据线连接手机的情况下，我先来个打断点截图。<br><br>![](https://raw.githubusercontent.com/weiwosuoai/weiwosuoai.github.io/master/images/2016031500.png)<br><br>## 实现步骤 ##<br><br>首先，准备工作做好，需要借助如下这个辅助工具。<br><br>![](https://raw.githubusercontent.com/weiwosuoai/weiwosuoai.github.io/master/images/2016031501.png)<br><!-- more --><br>这是需要注册一个账号才能使用的，现在这个平台是开放注册，免费体验，看完觉得还可以的话觉得点这里注册试试： <br><br>[http://t.cn/R48gYL5](http://t.cn/R48gYL5)<br><br>工具准备好以后，点进去选一台手机，比如像我之前调试的时候选的是一台 **htc one M8**.<br><br>![](https://raw.githubusercontent.com/weiwosuoai/weiwosuoai.<br></p>";
		System.out.println(htmlStr2MarkdownStr(htmlStr));
	}

}
