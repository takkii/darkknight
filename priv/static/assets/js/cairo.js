/**
 * Updated by Takayuki Kamiyama on 2026/01/02.
 * Team 'Red Eyes, Black Dragon.'
 */

$(function () {
    $('a[href^=#]').click(function () {
        const speed = 400; // millisecond
        let href = $(this).attr("href");
        const target = $(href === "#" || href === "" ? 'html' : href);
        $($.browser.safari ? 'body' : 'html').animate({
            scrollTop: position
        }, speed, 'swing');
        let body = 'body';
        const userAgent = window.navigator.userAgent.toLowerCase();
        if (userAgent.indexOf('msie') > -1 || userAgent.indexOf('trident') > -1 || userAgent.indexOf("firefox") > -1) {
            body = 'html';
        }
        $(body).animate({
            scrollTop: position
        }, speed, 'swing');
        return false;
    });
});