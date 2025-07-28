/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement'; 
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, Row,
  TextAlign, SafeAreaEdge, TextOverflow, Image ,FlexAlign, SafeAreaType, $r, Builder, Color,
  TextInput, Divider, JSON, Margin, Navigation, FontWeight, ResourceStr
} from '@ohos.arkui.component'; 
import { State, MutableState, stateOf, observableProxy, Prop, Watch } from '@ohos.arkui.stateManagement'; 
import hilog from '@ohos.hilog';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext } from '@ohos.arkui.UIContext';
import { Contact, RouterParams } from '../model/Contact';
import router from '@ohos.router';
import { CommonConstants } from '../constant/CommonConstant';
import json from '@ohos.util.json';
import { taskPoolExecuteQuery } from './TaskPool';

@Entry
@Component
struct AddressBookEdit {
  @State data: Contact = new Contact();
  @State textData: string = '';
  @State dataArray: Array<Contact> = [
    new Contact('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', 'operate_rdb_in_taskpool_photo1.jpg', 'A'),
    new Contact('阿诺德', '16666666666', 'arnold@example.com', '上海市浦东新区', '', 'A'),
    new Contact('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'B'),
    new Contact('本', '12222222222', 'ben@example.com', '四川省成都市锦江区', 'operate_rdb_in_taskpool_photo22.jpg', 'B'),
    new Contact('本杰明', '16666666666', 'benjieiming@example.com', '上海市浦东新区', 'operate_rdb_in_taskpool_photo5.jpg', 'B'),
    new Contact('卡梅隆', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', 'operate_rdb_in_taskpool_photo11.jpg', 'C'),
    new Contact('康纳', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', 'operate_rdb_in_taskpool_photo7.jpg', 'C'),
    new Contact('卡特琳娜', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'C'),
    new Contact('丹尼尔', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', 'operate_rdb_in_taskpool_photo11.jpg', 'D'),
    new Contact('戴维维', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'D'),
    new Contact('艾登', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', 'operate_rdb_in_taskpool_photo11.jpg', 'E'),
    new Contact('艾拉', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', 'operate_rdb_in_taskpool_photo7.jpg', 'E'),
    new Contact('艾里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'E'),
    new Contact('法比而', '10000000000', 'connor@example.com', '辽宁省沈阳市沈河区', 'operate_rdb_in_taskpool_photo7.jpg', 'F'),
    new Contact('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F'),
  ];
  @State isName: boolean = false;
  aboutToAppear(): void {
    setTimeout( ()=>{
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const data = (this.getUIContext().getRouter().getParams() as RouterParams).data;
      const textData = (this.getUIContext().getRouter().getParams() as RouterParams).text;
      if (!data || !textData) {
        return;
      }
      this.data = data;
      this.textData = textData;
      // 数据查看操作
      taskPoolExecuteQuery(context).then((arr: Array<Contact>) => {
        // 数据库查看成功
        hilog.info(0x0000, 'testTag', 'taskPoolExecuteQuery, arr: ' + JSON.stringify(arr))
        this.dataArray = [...arr]
      }).catch((err: Error)=>{
        hilog.info(0x0000, 'testTag', 'taskPoolExecuteQuery, err: ' + err)
      })
    }, 1)
  }

  @Builder
  navDestinationTitle(name: ResourceStr | string | undefined) {
    Row() {
      Column() {
        Image($r('app.media.operate_rdb_in_taskpool_arrow_left'))
          .width(28)
          .height(28)
      }
      .onClick(():void => {
        this.getUIContext().getRouter().back()
      })
      .justifyContent(FlexAlign.Center)
      .width(40)
      .height(40)
      .borderRadius(CommonConstants.BORDER_RADIUS_PROMINENT)
      .backgroundColor('#E5E7E9')

      Text(name)
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
        .width(230)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Column() {
        Image($r('app.media.operate_rdb_in_taskpool_ok'))
          .width(25)
          .height(25)
          .id('taskpool_button_ok')
      }
      .onClick(():void => {
        let params = new RouterParams(this.textData, this.data);
        let options: router.RouterOptions = {
          url: 'pages/view/OperateRDBInTaskPool',
          params: params
        } as router.RouterOptions;
        if(!this.isName){
          this.getUIContext().getRouter().pushUrl(options);
        };
      })
      .justifyContent(FlexAlign.Center)
      .width(40)
      .height(40)
      .borderRadius(CommonConstants.BORDER_RADIUS_PROMINENT)
      .backgroundColor('#E5E7E9')
    }
    .expandSafeArea([SafeAreaType.KEYBOARD])
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .margin({ bottom: 8 } as Margin)
    .width(CommonConstants.FULL_PERCENT)
    .height(56)
  }

  build() {
    Column() {
      Column(){
        this.navDestinationTitle(this.textData);

        Image($r('app.media.operate_rdb_in_taskpool_portrait'))
          .height(100)
          .width(100)
          .margin({ top: 30 } as Margin)
          .backgroundColor('#d9d9d9')
          .border({
            width: CommonConstants.BORDER_WIDTH_BOLD,
            color: Color.White,
            radius: CommonConstants.BORDER_RADIUS_FULLY
          })
        if(this.textData !== '新增联系人'){
          Text(this.data.name)
            .id('taskpool_textinput_name')
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
            .fontColor('#222222')
            .height(60)
            .borderRadius(CommonConstants.BORDER_RADIUS_MODERATE)
            .margin({
              left: 24,
              right: 24,
              bottom: 30
            } as Margin)
        }else {
          Row(){
            Text($r('app.string.operate_rdb_in_taskpool_text_input_name'))
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .width('15%')

            TextInput({ placeholder: $r('app.string.operate_rdb_in_taskpool_name_prompt_text'), text: this.data.name })
              .placeholderColor('#999999')
              .placeholderFont({
                size:  17,
                weight: FontWeight.Bold
              })
              .id('taskpool_textinput_phone')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
              .height(60)
              .width('85%')
              .maxLength(CommonConstants.MAX_LENGTH_MODERATE)
              .borderRadius(CommonConstants.BORDER_RADIUS_MODERATE)
              .backgroundColor('#e6e6e6')
              .onChange((value: string):void => {
                this.data.name = value;
                this.isName = this.dataArray.some((item:Contact)=> item.name === this.data.name);
              })
          }.margin({
            top: 30
          } as Margin)
        }

        Column() {
          Row(){
            Text($r('app.string.operate_rdb_in_taskpool_text_input_phone'))
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .width('15%')
            TextInput({ placeholder: $r('app.string.operate_rdb_in_taskpool_phone_prompt_text'), text: this.data.phone })
              .placeholderColor('#999999')
              .placeholderFont({
                size:  17,
                weight: FontWeight.Bold
              })
              .id('taskpool_textinput_phone')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
              .height(60)
              .width('85%')
              .maxLength(CommonConstants.MAX_LENGTH_MODERATE)
              .borderRadius(CommonConstants.BORDER_RADIUS_MODERATE)
              .backgroundColor('#e6e6e6')
              .onChange((value: string):void => {
                this.data.phone = value;
              })
          }

          Divider()
            .strokeWidth(CommonConstants.STROKE_WIDTH)
            .color('#ffffff')
            .margin({top: 10} as Margin)

          Row(){
            Text($r('app.string.operate_rdb_in_taskpool_detail_email'))
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .width('15%')

            TextInput({
              placeholder: $r('app.string.operate_rdb_in_taskpool_email_prompt_text'),
              text: this.data.email
            })
              .placeholderColor('#999999')
              .placeholderFont({
                size: 17,
                weight: FontWeight.Bold
              })
              .id('taskpool_textinput_email')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
              .height(60)
              .width('85%')
              .maxLength(CommonConstants.MAX_LENGTH_LONG)
              .borderRadius(CommonConstants.BORDER_RADIUS_MODERATE)
              .backgroundColor('#e6e6e6')
              .margin({top: 10} as Margin)
              .onChange((value: string):void => {
                this.data.email = value;
              })
          }
          Divider()
            .strokeWidth(CommonConstants.STROKE_WIDTH)
            .color('#ffffff')
            .margin({top: 10} as Margin)

          Row(){
            Text($r('app.string.operate_rdb_in_taskpool_detail_address'))
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .width('15%')

            TextInput({
              placeholder: $r('app.string.operate_rdb_in_taskpool_address_prompt_text'),
              text: this.data.address
            })
              .placeholderColor('#999999')
              .placeholderFont({
                size: 17,
                weight: FontWeight.Bold
              })
              .id('taskpool_textinput_address')
              .fontSize(17)
              .fontWeight(FontWeight.Bold)
              .fontColor('#222222')
              .height(60)
              .width('85%')
              .maxLength(CommonConstants.MAX_LENGTH_VERY_LONG)
              .borderRadius(CommonConstants.BORDER_RADIUS_MODERATE)
              .backgroundColor('#e6e6e6')
              .margin({top: 10} as Margin)
              .onChange((value: string):void => {
                this.data.address = value;
              })
          }
        }
        .margin({
          top: 10
        } as Margin)
        .borderRadius(CommonConstants.BORDER_RADIUS_MODERATE)
      }.width('90%')
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }
}
