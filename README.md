[![APEX Plugin](https://cdn.rawgit.com/Dani3lSun/apex-github-badges/b7e95341/badges/apex-plugin-badge.svg)](<https://eocoe.blogspot.com/2019/01/a-post-it-note-region-plugin-for-apex.html>)
APEX PlugIn: SBA_TRADINGVIEW
============================

This plugin is a region plugin for use in Oracle Application Express. The TradingView region plugIn will show the TradingView Technical Analysis widget in a region within your APEX application

## usage
Download the latest PlugIn SQL File from this repository and import it in your APEX application.

The region plugin has multiple attributes to be defined ;
 * Symbol	                - select stock or asset to be displayed , using the symbols as used in TradingView (eg. NYSE:ORCL)
 * Interval	              - for which interval, eg daily, weekly, monthly
 * showIntervalTabs	      - show the interval tabs so the user can change the interval technical analysis 
 * showFooter	            - optional show the copyright footer of TradingView
 * Transparant background	- optional use of transparant background
 * Color theme	          - light or dark theme
 * Custom width	          - optional to specify width of the widget
 * Custom height	        - optional to specify height of the widget
 * autosize	              - autosize will set the custom width and height on 100%       

## reference

https://www.tradingview.com/widget/technical-analysis/

