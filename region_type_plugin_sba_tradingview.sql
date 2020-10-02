prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>12391180323004392729
,p_default_application_id=>85382
,p_default_id_offset=>0
,p_default_owner=>'SB_DEV'
);
end;
/
 
prompt APPLICATION 85382 - Tradingview widget
--
-- Application Export:
--   Application:     85382
--   Name:            Tradingview widget
--   Date and Time:   14:05 Friday October 2, 2020
--   Exported By:     SIMON.BOORSMA@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 43230395099574900093
--   Manifest End
--   Version:         20.1.0.00.13
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/sba_tradingview
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(43230395099574900093)
,p_plugin_type=>'REGION TYPE'
,p_name=>'SBA_TRADINGVIEW'
,p_display_name=>'TradingViewWidget'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function addTradingViewRegion(  p_region              in apex_plugin.t_region',
'                             ,  p_plugin              in apex_plugin.t_plugin',
'                             ,  p_is_printer_friendly in boolean )',
'return apex_plugin.t_region_render_result',
'is',
'  -- plugin attributes',
'  l_symbol         varchar2(32676)  := p_region.attribute_01;',
'  l_interval       varchar2(32676)  := p_region.attribute_02;',
'  l_interval_tabs  varchar2(32676)  := p_region.attribute_03;',
'  l_show_footer    varchar2(32676)  := p_region.attribute_04;',
'  l_transparant    varchar2(32676)  := p_region.attribute_05;',
'  l_color_theme    varchar2(32676)  := p_region.attribute_06;    ',
'  l_width          varchar2(32676)  := p_region.attribute_07;',
'  l_height         varchar2(32676)  := p_region.attribute_08;    ',
'  l_autosize       varchar2(32676)  := p_region.attribute_09;    ',
'  -- ',
'  l_display_symbol varchar2(32676) := substr(l_symbol,instr(l_symbol,'':'')+1);',
'  -- dummy result',
'  l_result         apex_plugin.t_region_render_result;',
'begin',
'  -- check atributes ',
'    l_interval_tabs := case when l_interval_tabs = ''Y'' then ''true'' else ''false'' end;',
'    l_transparant := case when l_transparant = ''Y'' then ''true'' else ''false'' end;',
'    -- check autosize',
'    if nvl(l_autosize,''N'') = ''Y'' then l_width := ''100%''; l_height := ''100%''; end if;',
'  -- render the html',
'  htp.prn(''<div class="tradingview-widget-container">'');',
'  htp.prn(''<div class="tradingview-widget-container__widget"></div>'');',
'  if l_show_footer = ''Y''',
'  then',
'    htp.prn(''<div class="tradingview-widget-copyright"><a href="https://www.tradingview.com/symbols/''||l_symbol||''/technicals/" rel="noopener" target="_blank">'');',
'    htp.prn(''<span class="blue-text">Technical Analysis for ''||l_display_symbol||''</span></a> by TradingView</div>'');',
'  end if;',
'  htp.prn(''<script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-technical-analysis.js" async>'');',
'  htp.p(''{'');',
'  htp.p(''  "interval": "''||l_interval||''",'');',
'  htp.p(''  "width": "''||l_width||''",'');',
'  htp.p(''  "isTransparent": ''||l_transparant||'','');',
'  htp.p(''  "height": "''||l_height||''",'');',
'  htp.p(''  "symbol": "''||l_symbol||''",'');',
'  htp.p(''  "showIntervalTabs": ''||l_interval_tabs||'','');',
'  htp.p(''  "locale": "en",'');',
'  htp.p(''  "colorTheme": "''||l_color_theme||''"'');',
'  htp.p(''}'');',
'  htp.prn(''  </script>''); ',
'  htp.prn(''</div>''); ',
'  return l_result;',
'  --',
'end addTradingViewRegion;'))
,p_api_version=>2
,p_render_function=>'addTradingViewRegion'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Technical Analysis Widget',
'The Technical Analysis Widget is an advanced tool that displays ratings based on technical indicators. ',
'Our beautifully designed gauge lets you see the summary based on all indicators at a quick glance. ',
'You no longer have to apply multiple indicators to analyze a financial instrument since our widget does that for you.',
' On top of that, all ratings are shown in real time.'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://www.tradingview.com/widget/technical-analysis/'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43232304703467957518)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Symbol'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_help_text=>'Select stock or asset to be displayed , using the symbols as used in TradingView (eg. NYSE:ORCL)'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43233092345840960272)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Interval'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'1D'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Select for which interval the technical analysis widget will be displayed, eg daily, weekly, monthly'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43233244981967973069)
,p_plugin_attribute_id=>wwv_flow_api.id(43233092345840960272)
,p_display_sequence=>10
,p_display_value=>'1 hour'
,p_return_value=>'1h'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43233247433312975735)
,p_plugin_attribute_id=>wwv_flow_api.id(43233092345840960272)
,p_display_sequence=>20
,p_display_value=>'1 day'
,p_return_value=>'1D'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43233249234245976928)
,p_plugin_attribute_id=>wwv_flow_api.id(43233092345840960272)
,p_display_sequence=>30
,p_display_value=>'1 week'
,p_return_value=>'1W'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43233252708162978043)
,p_plugin_attribute_id=>wwv_flow_api.id(43233092345840960272)
,p_display_sequence=>40
,p_display_value=>'1 month'
,p_return_value=>'1M'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43233511270801991221)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'showIntervalTabs'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Show the interval tabs so the user can change the interval technical analysis'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43237346288075246971)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'showFooter'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'Optional show the copyright footer of TradingView'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43237728861204259595)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Transparant background'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
,p_help_text=>'Use of transparant background'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43239255452821327455)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Color theme'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'light'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43239443086667330115)
,p_plugin_attribute_id=>wwv_flow_api.id(43239255452821327455)
,p_display_sequence=>10
,p_display_value=>'Light'
,p_return_value=>'light'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43238534701655678340)
,p_plugin_attribute_id=>wwv_flow_api.id(43239255452821327455)
,p_display_sequence=>20
,p_display_value=>'Dark'
,p_return_value=>'dark'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43240470258611375182)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>80
,p_prompt=>'Custom width'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(43240979088736726254)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43240882146753376352)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>90
,p_prompt=>'Custom height'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(43240979088736726254)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NULL'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(43240979088736726254)
,p_plugin_id=>wwv_flow_api.id(43230395099574900093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>70
,p_prompt=>'autosize'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Autosize will set the custom width and height on 100%'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(43240769651155380787)
,p_plugin_attribute_id=>wwv_flow_api.id(43240979088736726254)
,p_display_sequence=>10
,p_display_value=>' '
,p_return_value=>'Y'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
