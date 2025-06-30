/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement'
import { curUser, mockData } from '../mock/NewsDetailData';
import { NewsCommentModel } from '../model/NewsCommentModel';
import { CommentPage } from '../components/CommentPage';
import { UIContext } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import util from '@ohos.util';
import { Row, FlexAlign, HorizontalAlign, Column, Stack, Alignment, Image, ImageFit, $r, Text, TextAlign, ImageSpan, ImageSpanAlignment, Span, Scroll, ScrollState, OnScrollFrameBeginHandlerResult, OnScrollFrameBeginCallback, Scroller, ScrollDirection, ScrollAlign, BarState, Search, List, ListItem, ListItemAlign, ForEach, Blank, Color, Margin, Padding, Builder, ClickEvent, Component, UserView } from '@ohos.arkui.component'
import { AppStorage, StorageProp, State, StateDecoratedVariable, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement'

const SEARCH_BUTTON: string = '搜索';
AppStorage.setOrCreate('PropA', '');

@Component
struct MyStateSample {
  listScroller: Scroller = new Scroller();
  scroller: Scroller = new Scroller();
  @State commentList: NewsCommentModel[] = new Array<NewsCommentModel>();
  curUser: string = curUser;
  @StorageProp('PropA') storage: string = '';

  aboutToAppear() {
    this.commentList = mockData();
  }

  onPageShow() {
    if (this.storage !== '') {
      this.publishComment();
    }
  }

  publishComment(): void {
    const uuid: string = util.generateRandomUUID();
    const comment: NewsCommentModel = new NewsCommentModel(uuid, $r('app.media.news_user_select'), this.curUser, '', '', this.storage, new Date());
    this.commentList.unshift(comment);
    this.commentList = [...this.commentList];
    this.listScroller.scrollToIndex(0, true, ScrollAlign.START);
  }

  build() {
    Column() {
      this.title()

      Scroll(this.scroller) {
        Column() {
          this.newsBuilder()
          this.CommentTitle()
          this.listBuilder()
        }
        .width('100%')
      }
      .width('100%')
      .layoutWeight(1)
      .scrollBar(BarState.Off)

      Column() {
        Text('发布评论')
          .width('100%')
          .height(40)
          .borderRadius(30)
          .backgroundColor(Color.White)
          .border({ width: 1, color: '#eeeeee' })
          .padding({ left: 15 } as Padding)
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({ url: 'pages/CommentInputPage' });
          })
        PublishView()
      }
      .width('100%')
      .padding({ left: 10, right: 10, top: 10 } as Padding)
      .height(100)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  title() {
    Row() {
      Stack({ alignContent: Alignment.Bottom }) {
        Image($r('app.media.news_batman'))
          .width(55)
          .height(55)
          .borderRadius(30)
        Text('+关注')
          .fontColor('#ff3d36')
          .fontSize(11)
          .borderRadius(3)
          .height(16)
          .width(55)
          .backgroundColor('#ffeeee')
          .textAlign(TextAlign.Center)
      }
      Search({
        placeholder: '搜你想看的'
      })
        .enableKeyboardOnFocus(false)
        .searchButton(SEARCH_BUTTON)
        .layoutWeight(1)
        .height('75%')
        .backgroundColor('#ffffff')
        .placeholderColor(Color.Grey)
        .placeholderFont({
          size: 14,
          weight: 400
        })
        .margin({ left: 15 } as Margin)
      Row() {
        Text('听')
          .fontSize(22)
          .margin({ left: 15 } as Margin)
        Image($r('app.media.news_more'))
          .width(30)
          .height(30)
          .margin({ left: 15 } as Margin)
      }
    }
    .width('100%')
    .height(55)
    .padding({ left: 10, right: 10 } as Padding)
  }

  @Builder
  newsBuilder() {
    Column() {
      Text('沪媒：国足对阵印尼67年不败金身若被破，足协大概率会考虑换帅')
        .width('100%')
        .fontSize(20)
        .fontWeight(600)
        .margin({ top: 10, bottom: 10 } as Margin)
      Row() {
        Image('https://res.hancibao.com/img/kai/05/5427.png')
          .width(40)
          .height(40)
        Column() {
          Text('直播吧')
            .fontSize(14)
          Text('2024-10-15 09:31 发布于美国 直播吧官方账号')
            .fontSize(12)
        }
        .layoutWeight(1)
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(HorizontalAlign.Start)
        .height('100%')
        .margin({ left: 10 } as Margin)
        Text('+关注')
          .fontSize(13)
          .fontColor('#ffffff')
          .backgroundColor('#ff3f3a')
          .borderRadius(3)
          .textAlign(TextAlign.Center)
          .width(50)
          .height(25)
          .margin({ left: 10 } as Margin)
      }
      .width('100%')
      .height(40)
      .margin({ top: 10, bottom: 10 } as Margin)
      Image('https://bpic.588ku.com/back_origin_min_pic/21/04/07/23c8806be022255931d5dcb04c762f37.jpg')
        .width('100%')
        .objectFit(ImageFit.Contain)
        .borderRadius(6)
        .margin({ top: 10, bottom: 10 } as Margin)
      Text('直播吧10月15日讯 ;对于今晚国足主场对阵印尼的18强赛第4轮比赛，上观新闻发文进行了分析，认为国足对阵印尼67年不败金身若被破，主教练伊万科维奇很可能会就此下课。\n\n' +
        '10月15日，青岛青春足球场，克罗地亚籍主教练伊万科维奇执教的中国男足，将在这里交锋2026美加墨世界杯亚洲区18强赛C组的第四个对手——印尼队。尽管历史数据一片光明：国足对阵印尼足球已保持67年不败，历史上更有多次5比0的大比分赢球，然而，保守固执的伊万科维奇用兵迟缓，印尼足球通过归化迅速提升实力，国足此番交锋印尼很有可能迎来颠覆此前历史数据的惊人一幕。\n\n' +
        '客场负于澳大利亚队后，中国队主教练伊万科维奇曾表示，对阵印尼队是“真正战斗的开始”。伊万的目标很明确：前三场的对手——日本、沙特和澳大利亚队，都是亚洲一流强队，国足连输三场从结果来说是赛前能想到的；但是，如果要争取小组第四，以获得下阶段比赛的资格，国足就要力争在主场击败印尼队，全取三分。\n\n' +
        '其实，在伊万科维奇执教国足在大连11打10竟也能被少一人的沙特队逆转后，中国足协就有过换帅的想法，但被更高层面的机构否定。逃过一劫的伊万科维奇继续获得了两轮执教机会，但更衣室内球员对他的信任已经降至冰点，全国媒体、球迷也缺乏对这位老帅的足够信任。毕竟，国足3场丢了12个球，其中6个都是头球、4个是定位球失分，这些数据足以表明，伊万科维奇领衔的教练组工作不及格，备战不到位。此外，伊万科维奇在人员选拔、战术设计、临场指挥、责任担当等诸多环节，也存在不小的争议。\n\n' +
        '有媒体也直接提问伊万科维奇，“过去三场比赛都有补时丢球、定位球失球，教练组是否解决了问题，你的压力大不大？”这位70岁老帅的回答，其实更多像是推卸责任，他再一次甩锅给球员，“我们在补时丢了一些球，具体是5个球，其中有4个是定位球。球员的注意力要更集中，我们要更强调注意力集中到最后一分钟，但不可忽视的是，前三个对手都是小组最强的球队，是亚洲一流球队，长期参加世界杯，比赛难度可想而知。我作为职业教练，四十年的执教经历让我有能力抵抗压力。有机会挑战压力时，我也愿意承担压力。”\n\n' +
        '尽管伊万科维奇在输球后从来只会甩锅，但如果此番国足在主场依旧无法取得满意的成绩，遭遇世预赛史无前例的四连败。尤其是国足对阵印尼67年不败金身在青岛被破，第四次引发广大球迷、媒体对教练组的强烈质疑，中国足协大概率会考虑换帅事宜。')
        .fontSize(18)
        .lineHeight(20)
        .margin({ top: 10, bottom: 20 } as Margin)
      Text('免责声明：本内容来自xx平台创作者，不代表xx新闻或xx网的观点和立场。')
        .width('100%')
        .fontSize(14)
      Row() {
        Image('https://inews.gtimg.com/newsapp_bt/0/1012205723968_6694/0')
          .width(40)
          .height(40)
          .margin({ right: 5 } as Margin)
        Text('举报')
      }
      .width('100%')
      .margin({ top: 10, bottom: 10 } as Margin)
    }
    .width('100%')
    .padding({ left: 10, right: 10 } as Padding)
  }

  @Builder
  CommentTitle() {
    Row() {
      Text('评论 306')
        .fontSize(20)
        .fontWeight(700)
      Blank()
      Text('526 赞 | 49 转发')
        .fontSize(14)
        .fontWeight(700)
    }
    .width('95%')
    .height(30)
  }

  @Builder
  listBuilder() {
    List({ scroller: this.listScroller }) {
      ForEach(this.commentList, (item: NewsCommentModel) => {
        ListItem() {
          CommentPage({ commonData: item })
        }
      }, (item: NewsCommentModel) => item.id)
    }
    .alignListItem(ListItemAlign.Center)
    .scrollBar(BarState.Off)
    .enableScrollInteraction(false)
    .width('100%')
  }
}

@Component
struct PublishView {
  build() {
    Row() {
      Text() {
        ImageSpan($r('app.media.news_share'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Fill)
          .verticalAlign(ImageSpanAlignment.CENTER)
          .margin({ left: 5, right: 8 } as Margin)
        Span('分享')
      }.width('25%')
      Text() {
        ImageSpan($r('app.media.news_comment'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Fill)
          .verticalAlign(ImageSpanAlignment.CENTER)
          .margin({ left: 5, right: 8 } as Margin)
        Span('评论')
      }.width('25%')
      Text() {
        ImageSpan($r('app.media.news_follow'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Fill)
          .verticalAlign(ImageSpanAlignment.CENTER)
          .margin({ left: 5, right: 8 } as Margin)
        Span('点赞')
      }.width('25%')
      Text() {
        ImageSpan($r('app.media.news_star'))
          .width(20)
          .height(20)
          .objectFit(ImageFit.Fill)
          .verticalAlign(ImageSpanAlignment.CENTER)
          .margin({ left: 5, right: 8 } as Margin)
        Span('收藏')
      }.width('25%')
    }
    .width('100%')
    .height(60)
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    hilog.info(0x0000, 'testTag', 'getBuilder');
    let wrapper = @memo () => {
      hilog.info(0x0000, 'testTag', 'MyStateSample');
      MyStateSample(undefined)
    }
    return wrapper
  }
}