//
//  NSString+FontAwesome.m
//
//  Copyright (c) 2012 Alex Usbergo. All rights reserved.
//
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//

#import "NSString+FontAwesome.h"

@implementation NSString (FontAwesome)

#pragma mark - public

/* Returns the correct enum for a font-awesome icon.
 * The list of identifiers can be found here:
 * http://fortawesome.github.com/Font-awesome/#all-icons */
+ (FAWEIcon)fontAwesomeEnumForIconIdentifier:(NSString*)string
{
    NSDictionary *enums = [self enumDictionary];
    return [enums[string] integerValue];
}

/* Returns the font-awesome character associated to the
 * icon enum passed as argument */
+ (NSString*)fontAwesomeIconStringForEnum:(FAWEIcon)value
{
    return [self fontAwesomeIcons][value];
}

/* Returns the font-awesome character associated to the font-awesome
 * identifier.
 * http://fortawesome.github.com/Font-awesome/#all-icons */
+ (NSString*)fontAwesomeIconStringForIconIdentifier:(NSString*)identifier
{
    return [self fontAwesomeIconStringForEnum:[self fontAwesomeEnumForIconIdentifier:identifier]];
}

#pragma mark - data initialization

+ (NSArray*)fontAwesomeIcons
{
    static NSArray *fontAwesomeIcons;
    if (nil == fontAwesomeIcons) {
        fontAwesomeIcons = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    }
    return fontAwesomeIcons;
}

+ (NSDictionary*)enumDictionary
{
	static NSDictionary *enumDictionary;
	if (nil == enumDictionary) {
		NSMutableDictionary *tmp = [[NSMutableDictionary alloc] init];
		tmp[@"icon-glass"] = @(FAWEIconGlass);
		tmp[@"icon-music"] = @(FAWEIconMusic);
		tmp[@"icon-search"] = @(FAWEIconSearch);
		tmp[@"icon-envelope"] = @(FAWEIconEnvelope);
		tmp[@"icon-heart"] = @(FAWEIconHeart);
		tmp[@"icon-star"] = @(FAWEIconStar);
		tmp[@"icon-star-empty"] = @(FAWEIconStarEmpty);
		tmp[@"icon-user"] = @(FAWEIconUser);
		tmp[@"icon-film"] = @(FAWEIconFilm);
		tmp[@"icon-th-large"] = @(FAWEIconThLarge);
		tmp[@"icon-th"] = @(FAWEIconTh);
		tmp[@"icon-th-list"] = @(FAWEIconThList);
		tmp[@"icon-ok"] = @(FAWEIconOk);
		tmp[@"icon-remove"] = @(FAWEIconRemove);
		tmp[@"icon-zoom-in"] = @(FAWEIconZoomIn);
		tmp[@"icon-zoom-out"] = @(FAWEIconZoomOut);
		tmp[@"icon-off"] = @(FAWEIconOff);
		tmp[@"icon-signal"] = @(FAWEIconSignal);
		tmp[@"icon-cog"] = @(FAWEIconCog);
		tmp[@"icon-trash"] = @(FAWEIconTrash);
		tmp[@"icon-home"] = @(FAWEIconHome);
		tmp[@"icon-file"] = @(FAWEIconFile);
		tmp[@"icon-time"] = @(FAWEIconTime);
		tmp[@"icon-road"] = @(FAWEIconRoad);
		tmp[@"icon-download-alt"] = @(FAWEIconDownloadAlt);
		tmp[@"icon-download"] = @(FAWEIconDownload);
		tmp[@"icon-upload"] = @(FAWEIconUpload);
		tmp[@"icon-inbox"] = @(FAWEIconInbox);
		tmp[@"icon-play-circle"] = @(FAWEIconPlayCircle);
		tmp[@"icon-repeat"] = @(FAWEIconRepeat);
		tmp[@"icon-refresh"] = @(FAWEIconRefresh);
		tmp[@"icon-list-alt"] = @(FAWEIconListAlt);
		tmp[@"icon-lock"] = @(FAWEIconLock);
		tmp[@"icon-flag"] = @(FAWEIconFlag);
		tmp[@"icon-headphones"] = @(FAWEIconHeadphones);
		tmp[@"icon-volume-off"] = @(FAWEIconVolumeOff);
		tmp[@"icon-volume-down"] = @(FAWEIconVolumeDown);
		tmp[@"icon-volume-up"] = @(FAWEIconVolumeUp);
		tmp[@"icon-qrcode"] = @(FAWEIconQrcode);
		tmp[@"icon-barcode"] = @(FAWEIconBarcode);
		tmp[@"icon-tag"] = @(FAWEIconTag);
		tmp[@"icon-tags"] = @(FAWEIconTags);
		tmp[@"icon-book"] = @(FAWEIconBook);
		tmp[@"icon-bookmark"] = @(FAWEIconBookmark);
		tmp[@"icon-print"] = @(FAWEIconPrint);
		tmp[@"icon-camera"] = @(FAWEIconCamera);
		tmp[@"icon-font"] = @(FAWEIconFont);
		tmp[@"icon-bold"] = @(FAWEIconBold);
		tmp[@"icon-italic"] = @(FAWEIconItalic);
		tmp[@"icon-text-height"] = @(FAWEIconTextHeight);
		tmp[@"icon-text-width"] = @(FAWEIconTextWidth);
		tmp[@"icon-align-left"] = @(FAWEIconAlignLeft);
		tmp[@"icon-align-center"] = @(FAWEIconAlignCenter);
		tmp[@"icon-align-right"] = @(FAWEIconAlignRight);
		tmp[@"icon-align-justify"] = @(FAWEIconAlignJustify);
		tmp[@"icon-list"] = @(FAWEIconList);
		tmp[@"icon-indent-left"] = @(FAWEIconIndentLeft);
		tmp[@"icon-indent-right"] = @(FAWEIconIndentRight);
		tmp[@"icon-facetime-video"] = @(FAWEIconFacetimeVideo);
		tmp[@"icon-picture"] = @(FAWEIconPicture);
		tmp[@"icon-pencil"] = @(FAWEIconPencil);
		tmp[@"icon-map-marker"] = @(FAWEIconMapMarker);
		tmp[@"icon-adjust"] = @(FAWEIconAdjust);
		tmp[@"icon-tint"] = @(FAWEIconTint);
		tmp[@"icon-edit"] = @(FAWEIconEdit);
		tmp[@"icon-share"] = @(FAWEIconShare);
		tmp[@"icon-check"] = @(FAWEIconCheck);
		tmp[@"icon-move"] = @(FAWEIconMove);
		tmp[@"icon-step-backward"] = @(FAWEIconStepBackward);
		tmp[@"icon-fast-backward"] = @(FAWEIconFastBackward);
		tmp[@"icon-backward"] = @(FAWEIconBackward);
		tmp[@"icon-play"] = @(FAWEIconPlay);
		tmp[@"icon-pause"] = @(FAWEIconPause);
		tmp[@"icon-stop"] = @(FAWEIconStop);
		tmp[@"icon-forward"] = @(FAWEIconForward);
		tmp[@"icon-fast-forward"] = @(FAWEIconFastForward);
		tmp[@"icon-step-forward"] = @(FAWEIconStepForward);
		tmp[@"icon-eject"] = @(FAWEIconEject);
		tmp[@"icon-chevron-left"] = @(FAWEIconChevronLeft);
		tmp[@"icon-chevron-right"] = @(FAWEIconChevronRight);
		tmp[@"icon-plus-sign"] = @(FAWEIconPlusSign);
		tmp[@"icon-minus-sign"] = @(FAWEIconMinusSign);
		tmp[@"icon-remove-sign"] = @(FAWEIconRemoveSign);
		tmp[@"icon-ok-sign"] = @(FAWEIconOkSign);
		tmp[@"icon-question-sign"] = @(FAWEIconQuestionSign);
		tmp[@"icon-info-sign"] = @(FAWEIconInfoSign);
		tmp[@"icon-screenshot"] = @(FAWEIconScreenshot);
		tmp[@"icon-remove-circle"] = @(FAWEIconRemoveCircle);
		tmp[@"icon-ok-circle"] = @(FAWEIconOkCircle);
		tmp[@"icon-ban-circle"] = @(FAWEIconBanCircle);
		tmp[@"icon-arrow-left"] = @(FAWEIconArrowLeft);
		tmp[@"icon-arrow-right"] = @(FAWEIconArrowRight);
		tmp[@"icon-arrow-up"] = @(FAWEIconArrowUp);
		tmp[@"icon-arrow-down"] = @(FAWEIconArrowDown);
		tmp[@"icon-share-alt"] = @(FAWEIconShareAlt);
		tmp[@"icon-resize-full"] = @(FAWEIconResizeFull);
		tmp[@"icon-resize-small"] = @(FAWEIconResizeSmall);
		tmp[@"icon-plus"] = @(FAWEIconPlus);
		tmp[@"icon-minus"] = @(FAWEIconMinus);
		tmp[@"icon-asterisk"] = @(FAWEIconAsterisk);
		tmp[@"icon-exclamation-sign"] = @(FAWEIconExclamationSign);
		tmp[@"icon-gift"] = @(FAWEIconGift);
		tmp[@"icon-leaf"] = @(FAWEIconLeaf);
		tmp[@"icon-fire"] = @(FAWEIconFire);
		tmp[@"icon-eye-open"] = @(FAWEIconEyeOpen);
		tmp[@"icon-eye-close"] = @(FAWEIconEyeClose);
		tmp[@"icon-warning-sign"] = @(FAWEIconWarningSign);
		tmp[@"icon-plane"] = @(FAWEIconPlane);
		tmp[@"icon-calendar"] = @(FAWEIconCalendar);
		tmp[@"icon-random"] = @(FAWEIconRandom);
		tmp[@"icon-comment"] = @(FAWEIconComment);
		tmp[@"icon-magnet"] = @(FAWEIconMagnet);
		tmp[@"icon-chevron-up"] = @(FAWEIconChevronUp);
		tmp[@"icon-chevron-down"] = @(FAWEIconChevronDown);
		tmp[@"icon-retweet"] = @(FAWEIconRetweet);
		tmp[@"icon-shopping-cart"] = @(FAWEIconShoppingCart);
		tmp[@"icon-folder-close"] = @(FAWEIconFolderClose);
		tmp[@"icon-folder-open"] = @(FAWEIconFolderOpen);
		tmp[@"icon-resize-vertical"] = @(FAWEIconResizeVertical);
		tmp[@"icon-resize-horizontal"] = @(FAWEIconResizeHorizontal);
		tmp[@"icon-bar-chart"] = @(FAWEIconBarChart);
		tmp[@"icon-twitter-sign"] = @(FAWEIconTwitterSign);
		tmp[@"icon-facebook-sign"] = @(FAWEIconFacebookSign);
		tmp[@"icon-camera-retro"] = @(FAWEIconCameraRetro);
		tmp[@"icon-key"] = @(FAWEIconKey);
		tmp[@"icon-cogs"] = @(FAWEIconCogs);
		tmp[@"icon-comments"] = @(FAWEIconComments);
		tmp[@"icon-thumbs-up"] = @(FAWEIconThumbsUp);
		tmp[@"icon-thumbs-down"] = @(FAWEIconThumbsDown);
		tmp[@"icon-star-half"] = @(FAWEIconStarHalf);
		tmp[@"icon-heart-empty"] = @(FAWEIconHeartEmpty);
		tmp[@"icon-signout"] = @(FAWEIconSignout);
		tmp[@"icon-linkedin-sign"] = @(FAWEIconLinkedinSign);
		tmp[@"icon-pushpin"] = @(FAWEIconPushpin);
		tmp[@"icon-external-link"] = @(FAWEIconExternalLink);
		tmp[@"icon-signin"] = @(FAWEIconSignin);
		tmp[@"icon-trophy"] = @(FAWEIconTrophy);
		tmp[@"icon-github-sign"] = @(FAWEIconGithubSign);
		tmp[@"icon-upload-alt"] = @(FAWEIconUploadAlt);
		tmp[@"icon-lemon"] = @(FAWEIconLemon);
		tmp[@"icon-phone"] = @(FAWEIconPhone);
		tmp[@"icon-check-empty"] = @(FAWEIconCheckEmpty);
		tmp[@"icon-bookmark-empty"] = @(FAWEIconBookmarkEmpty);
		tmp[@"icon-phone-sign"] = @(FAWEIconPhoneSign);
		tmp[@"icon-twitter"] = @(FAWEIconTwitter);
		tmp[@"icon-facebook"] = @(FAWEIconFacebook);
		tmp[@"icon-github"] = @(FAWEIconGithub);
		tmp[@"icon-unlock"] = @(FAWEIconUnlock);
		tmp[@"icon-credit-card"] = @(FAWEIconCreditCard);
		tmp[@"icon-rss"] = @(FAWEIconRss);
		tmp[@"icon-hdd"] = @(FAWEIconHdd);
		tmp[@"icon-bullhorn"] = @(FAWEIconBullhorn);
		tmp[@"icon-bell"] = @(FAWEIconBell);
		tmp[@"icon-certificate"] = @(FAWEIconCertificate);
		tmp[@"icon-hand-right"] = @(FAWEIconHandRight);
		tmp[@"icon-hand-left"] = @(FAWEIconHandLeft);
		tmp[@"icon-hand-up"] = @(FAWEIconHandUp);
		tmp[@"icon-hand-down"] = @(FAWEIconHandDown);
		tmp[@"icon-circle-arrow-left"] = @(FAWEIconCircleArrowLeft);
		tmp[@"icon-circle-arrow-right"] = @(FAWEIconCircleArrowRight);
		tmp[@"icon-circle-arrow-up"] = @(FAWEIconCircleArrowUp);
		tmp[@"icon-circle-arrow-down"] = @(FAWEIconCircleArrowDown);
		tmp[@"icon-globe"] = @(FAWEIconGlobe);
		tmp[@"icon-wrench"] = @(FAWEIconWrench);
		tmp[@"icon-tasks"] = @(FAWEIconTasks);
		tmp[@"icon-filter"] = @(FAWEIconFilter);
		tmp[@"icon-briefcase"] = @(FAWEIconBriefcase);
		tmp[@"icon-fullscreen"] = @(FAWEIconFullscreen);
		tmp[@"icon-group"] = @(FAWEIconGroup);
		tmp[@"icon-link"] = @(FAWEIconLink);
		tmp[@"icon-cloud"] = @(FAWEIconCloud);
		tmp[@"icon-beaker"] = @(FAWEIconBeaker);
		tmp[@"icon-cut"] = @(FAWEIconCut);
		tmp[@"icon-copy"] = @(FAWEIconCopy);
		tmp[@"icon-paper-clip"] = @(FAWEIconPaperClip);
		tmp[@"icon-save"] = @(FAWEIconSave);
		tmp[@"icon-sign-blank"] = @(FAWEIconSignBlank);
		tmp[@"icon-reorder"] = @(FAWEIconReorder);
		tmp[@"icon-list-ul"] = @(FAWEIconListUl);
		tmp[@"icon-list-ol"] = @(FAWEIconListOl);
		tmp[@"icon-strikethrough"] = @(FAWEIconStrikethrough);
		tmp[@"icon-underline"] = @(FAWEIconUnderline);
		tmp[@"icon-table"] = @(FAWEIconTable);
		tmp[@"icon-magic"] = @(FAWEIconMagic);
		tmp[@"icon-truck"] = @(FAWEIconTruck);
		tmp[@"icon-pinterest"] = @(FAWEIconPinterest);
		tmp[@"icon-pinterest-sign"] = @(FAWEIconPinterestSign);
		tmp[@"icon-google-plus-sign"] = @(FAWEIconGooglePlusSign);
		tmp[@"icon-google-plus"] = @(FAWEIconGooglePlus);
		tmp[@"icon-money"] = @(FAWEIconMoney);
		tmp[@"icon-caret-down"] = @(FAWEIconCaretDown);
		tmp[@"icon-caret-up"] = @(FAWEIconCaretUp);
		tmp[@"icon-caret-left"] = @(FAWEIconCaretLeft);
		tmp[@"icon-caret-right"] = @(FAWEIconCaretRight);
		tmp[@"icon-columns"] = @(FAWEIconColumns);
		tmp[@"icon-sort"] = @(FAWEIconSort);
		tmp[@"icon-sort-down"] = @(FAWEIconSortDown);
		tmp[@"icon-sort-up"] = @(FAWEIconSortUp);
		tmp[@"icon-envelope-alt"] = @(FAWEIconEnvelopeAlt);
		tmp[@"icon-linkedin"] = @(FAWEIconLinkedin);
		tmp[@"icon-undo"] = @(FAWEIconUndo);
		tmp[@"icon-legal"] = @(FAWEIconLegal);
		tmp[@"icon-dashboard"] = @(FAWEIconDashboard);
		tmp[@"icon-comment-alt"] = @(FAWEIconCommentAlt);
		tmp[@"icon-comments-alt"] = @(FAWEIconCommentsAlt);
		tmp[@"icon-bolt"] = @(FAWEIconBolt);
		tmp[@"icon-sitemap"] = @(FAWEIconSitemap);
		tmp[@"icon-umbrella"] = @(FAWEIconUmbrella);
		tmp[@"icon-paste"] = @(FAWEIconPaste);
		tmp[@"icon-user-md"] = @(FAWEIconUserMd);
		tmp[@"icon-stethoscope"] = @(FAWEIconStethoscope);
		tmp[@"icon-building"] = @(FAWEIconBuilding);
		tmp[@"icon-hospital"] = @(FAWEIconHospital);
		tmp[@"icon-ambulance"] = @(FAWEIconAmbulance);
		tmp[@"icon-medkit"] = @(FAWEIconMedkit);
		tmp[@"icon-h-sign"] = @(FAWEIconHSign);
		tmp[@"icon-plus-sign-alt"] = @(FAWEIconPlusSignAlt);
		tmp[@"icon-spinner"] = @(FAWEIconSpinner);
		tmp[@"icon-cloud-download"] = @(FAWEIconCloudDownload);
		tmp[@"icon-cloud-upload"] = @(FAWEIconCloudUpload);
		tmp[@"icon-lightbulb"] = @(FAWEIconLightbulb);
		tmp[@"icon-exchange"] = @(FAWEIconExchange);
		tmp[@"icon-bell-alt"] = @(FAWEIconBellAlt);
		tmp[@"icon-file-alt"] = @(FAWEIconFileAlt);
		tmp[@"icon-beer"] = @(FAWEIconBeer);
		tmp[@"icon-coffee"] = @(FAWEIconCoffee);
		tmp[@"icon-food"] = @(FAWEIconFood);
		tmp[@"icon-fighter-jet"] = @(FAWEIconFighterJet);
		tmp[@"icon-angle-left"] = @(FAWEIconAngleLeft);
		tmp[@"icon-angle-right"] = @(FAWEIconAngleRight);
		tmp[@"icon-angle-up"] = @(FAWEIconAngleUp);
		tmp[@"icon-angle-down"] = @(FAWEIconAngleDown);
		tmp[@"icon-double-angle-left"] = @(FAWEIconDoubleAngleLeft);
		tmp[@"icon-double-angle-right"] = @(FAWEIconDoubleAngleRight);
		tmp[@"icon-double-angle-up"] = @(FAWEIconDoubleAngleUp);
		tmp[@"icon-double-angle-down"] = @(FAWEIconDoubleAngleDown);
		tmp[@"icon-circle-blank"] = @(FAWEIconCircleBlank);
		tmp[@"icon-circle"] = @(FAWEIconCircle);
		tmp[@"icon-desktop"] = @(FAWEIconDesktop);
		tmp[@"icon-laptop"] = @(FAWEIconLaptop);
		tmp[@"icon-tablet"] = @(FAWEIconTablet);
		tmp[@"icon-mobile-phone"] = @(FAWEIconMobilePhone);
		tmp[@"icon-quote-left"] = @(FAWEIconQuoteLeft);
		tmp[@"icon-quote-right"] = @(FAWEIconQuoteRight);
		tmp[@"icon-reply"] = @(FAWEIconReply);
		tmp[@"icon-github-alt"] = @(FAWEIconGithubAlt);
		tmp[@"icon-close-alt"] = @(FAWEIconFolderCloseAlt);
		tmp[@"icon-folder-open-alt"] = @(FAWEIconFolderOpenAlt);
		tmp[@"icon-suitcase"] = @(FAWEIconSuitcase);
		enumDictionary = tmp;
	}
    
    return enumDictionary;
}

@end
