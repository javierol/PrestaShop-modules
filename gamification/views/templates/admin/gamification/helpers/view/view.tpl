{*
* 2007-2013 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2013 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<script>
	var current_level_percent_tab = {$current_level_percent|intval};
	var current_level_tab = '{$current_level|intval}';
	var gamification_level_tab = '{l s='Level' js=1}';
	$(document).ready( function () {	
		$('#gamification_progressbar_tab').progressbar({
			change: function() {
		        if ({$current_level_percent})
		        	$( "#gamification_progress-label_tab" ).html( '{l s='Level' js=1}'+' '+{$current_level|intval}+' : '+$('#gamification_progressbar_tab').progressbar( "value" ) + "%" );
		        else
		        	$( "#gamification_progress-label_tab" ).html('');
		      },
	 	});
		$('#gamification_progressbar_tab').progressbar("value", {$current_level_percent|intval} );
		initBubbleDescription();
	});
	
</script>

{include file="toolbar.tpl" toolbar_btn=$toolbar_btn toolbar_scroll=$toolbar_scroll title=$title}
<fieldset>
	<div id="intro_gamification">
		<div id="left_intro">
			<h4>{l s="Become an e-commerce expert in leaps and bounds!"}</h4><br/>
			<p>
				{l s="With all of the great features and benefits that PrestaShop offers, it's important to keep up!"}<br/><br/>
				{l s="The main goal of all of the features we offer is to make you succeed in the e-commerce world. In order to accomplish this, we have created a system of badges and points that make it easy to monitor your progress as a merchant. We have broken down the system into three levels, all of which are integral to success in the e-commerce world: (i) Your use of key e-commerce features on your store; (ii) Your sales performance; (iii) Your presence in international markets."}<br/><br/>
				{l s="The more progress your store makes, the more badges and points you earn. No need to submit any information or fill out any forms; we know how busy you are, everything is automatic!"}<br/><br/>
				{l s="Now, with the click of a button, you will be able to see sales-enhancing features that you may be missing out on. Take advantage and check it out below!"}
			</p>
		</div>
		<div id="right_intro">
			<h4>{l s="Our Team is available to help you progress... Contact us now!"}</h4><br/>
			<ul>
				<li>
					<img src="../modules/gamification/views/img/phone_icon.png" alt="{l s="Phone"}" />
					<span>{l s="By phone: +1 (888) 947.6543"}</span>
				</li>
				<li>
					<img src="../modules/gamification/views/img/mail_icon.png" alt="{l s="Email"}" />
					<a href="mailto:#">{l s="By e-mail"}</a>
				</li>
			</ul>
		</div>
	</div>
	<div id="completion_gamification">
		<h4>{l s='Completion level'}</h4>
		<div id="gamification_progressbar_tab"></div>
		<span class="gamification_progress-label" id="gamification_progress-label_tab">{l s="Level"} {$current_level|intval} : {$current_level_percent|intval} %</span>
	</div>
</fieldset>
<div class="clear"></br></div>

{foreach from=$badges_type key=key item=type}
<fieldset>
	<legend><img src="../modules/gamification/views/img/{$key}.png" alt="{$type.name|escape:html:'UTF-8'}" /> {$type.name|escape:html:'UTF-8'}</legend>
	<ul class="badge_list" style="">
		{foreach from=$type.badges item=badge}
		<li class="badge_square {if $badge->validated}validated {else} not_validated{/if}" id="{$badge->id|intval}">
			<div class="gamification_badges_img"><img src="{$badge->getBadgeImgUrl()}"></div>
			<div class="gamification_badges_name">{$badge->name|escape:html:'UTF-8'}</div>
			<div class="gamification_badges_description" style="display:none">{$badge->description|escape:html:'UTF-8'}</div>
		</li>
		{foreachelse}
			<div class="gamification_badges_name">{l s="No badge in this section"}</div>
		{/foreach}
	</ul>
</fieldset>
<div class="clear"></br></div>
{/foreach}
