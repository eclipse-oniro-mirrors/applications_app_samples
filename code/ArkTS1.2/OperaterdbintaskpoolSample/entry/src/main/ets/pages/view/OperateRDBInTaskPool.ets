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

import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement'
import { Entry, Text, TextAttribute, Column, Component, Button, ButtonAttribute, ClickEvent, UserView, Row,
  SafeAreaEdge, Image, SafeAreaType,Stack, $r, Builder, Color, Search, SearchController, Margin
} from '@ohos.arkui.component'
import { State, MutableState, stateOf, observableProxy, Prop, Watch } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import common from '@ohos.app.ability.common';
import resourceManager from '@ohos.resourceManager'
import { BusinessError } from '@ohos.base'
import { UIContext } from '@ohos.arkui.UIContext'
import { Contact, RouterParams } from '../model/Contact';
import { CommonConstants } from '../constant/CommonConstant';
import { AddressBookList } from './AddressBookList';
import { taskPoolExecuteQuery, taskPoolExecuteInsert, taskPoolExecuteDelete,
  taskPoolExecuteUpdate, taskPoolExecuteBatchInsert } from './TaskPool';

@Entry
@Component
struct OperateRDBInTaskPool {
  // 搜索值
  @State changeValue: string = '';
  // 搜索控制器
  private controller: SearchController = new SearchController();
  // 数据库初始化数据
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
  // 路由传递数据
  @State routerData: Contact = new Contact();

  aboutToAppear(): void {
    setTimeout(()=>{
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      this.routerData = (this.getUIContext().getRouter().getParams() as RouterParams).data;
      // 数据插入操作
      if((this.getUIContext().getRouter().getParams() as RouterParams).text === '新增联系人'){
        taskPoolExecuteInsert(context, this.routerData).then(() => {
        // 数据库插入成功
        this.dataArray = [...this.dataArray,  this.routerData];
        }).catch((err: Error)=>{
          hilog.info(0x0000, 'testTag', 'taskPoolExecuteInsert, err: ' + err)
        })
      }
      // 数据删除操作
      if((this.getUIContext().getRouter().getParams() as RouterParams).text === '删除联系人'){
        taskPoolExecuteDelete(context, this.routerData).then(() => {
        // 数据库删除成功
        this.dataArray = this.dataArray.filter((item: Contact)=> {
          return item.name !== this.routerData.name
        });
        }).catch((err: Error)=>{
          hilog.info(0x0000, 'testTag', 'taskPoolExecuteDelete, err: ' + err)
        })
      }
      // 数据更新操作
      if((this.getUIContext().getRouter().getParams() as RouterParams).text === '编辑联系人'){
        taskPoolExecuteUpdate(context, this.routerData).then(() => {
        // 数据库更新成功
        for(let i = 0; i < this.dataArray.length; i++){
          if(this.dataArray[i].name === this.routerData.name){
            this.dataArray[i] = this.routerData
            this.dataArray = [...this.dataArray]
            return;
          }
        }
        }).catch((err: Error)=>{
          hilog.info(0x0000, 'testTag', 'taskPoolExecuteUpdate, err: ' + err)
        })
      }
    },1)
  }

  build() {
    Stack() {
      Column() {
        Text('← 返回')
          .fontSize(20)
          .width('90%')
          .margin({left: 8.5, bottom: 10} as Margin)
          .onClick(():void=>{
            this.getUIContext().getRouter().back();
          })
        // 搜索框
        Search({
          value: this.changeValue,
          placeholder: '搜索',
          controller: this.controller
        })
          .searchButton(CommonConstants.SEARCH_TEXT,
            { fontColor: '#0091FF' })
          .height(40)
          .margin({
            left: 12,
            right: 12,
            bottom: 15
          } as Margin)
          .backgroundColor('#d9d9d9')
          .placeholderColor(Color.Grey)
          .placeholderFont({ size: CommonConstants.SEARCH_TEXT_SIZE, weight: CommonConstants.SEARCH_TEXT_WEIGHT })
          .textFont({ size: CommonConstants.SEARCH_TEXT_SIZE, weight: CommonConstants.SEARCH_TEXT_WEIGHT })

        // 通讯录列表
        AddressBookList({ dataArray: this.dataArray })
      }
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
    }
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    hilog.info(0x0000, 'testTag', 'getBuilder');
    let wrapper = @memo() =>{
      hilog.info(0x0000, 'testTag', 'MyStateSample');
      OperateRDBInTaskPool(undefined)
    }
    return wrapper
  }
}