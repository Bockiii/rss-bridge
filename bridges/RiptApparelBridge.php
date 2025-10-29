<?php

class RiptApparelBridge extends BridgeAbstract
{
    const NAME = 'RIPT Apparel';
    const URI = 'https://www.riptapparel.com';
    const DESCRIPTION = 'Returns the daily designs';
    const MAINTAINER = 'Bockiii';
    const PARAMETERS = [];

    const CACHE_TIMEOUT = 60 * 60 * 3; // 3 hours

    public function collectData()
    {
        $html = getSimpleHTMLDOM(self::URI);

        foreach ($html->find('div.woocommerce', 0)->find('li.product') as $element) {
            $title = $element->find('img', 0)->getAttribute('alt');
            $uri = $element->find('a', 0)->href;
            $today = date('m/d/Y');
            $image = $element->find('img', 0)->getAttribute('src');
            $item = [];
            $item['uri'] = $uri;
            $item['title'] = $title;
            $item['uid'] = $title;
            $item['timestamp'] = $today;
            $item['content'] = '<a href="'
            . $uri
            . '"><img src="'
            . $image
            . '" /></a>';

            $this->items[] = $item;
        }
    }
}
