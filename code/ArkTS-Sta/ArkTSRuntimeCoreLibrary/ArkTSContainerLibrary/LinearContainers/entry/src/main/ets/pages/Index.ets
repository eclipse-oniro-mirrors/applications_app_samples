'use static'
/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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


import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Row, ButtonType, Margin, Scroller, Scroll, ForEach, FontWeight } from '@kit.ArkUI';

// [Start linear_container]
import { ArrayList, Deque, Stack, List } from '@kit.ArkTS'; // 导入ArrayList，Deque，Stack，List模块

let logMsg = ''

function testArrayList() {
  // [EndExclude linear_container]
  // ArrayList
  let arrayList1: ArrayList<string> = new ArrayList<string>();
  arrayList1.add('a'); // 增加一个值为'a'的元素
  let arrayList2: ArrayList<int> = new ArrayList<int>();
  arrayList2.add(1); // 增加一个值为1的元素
  console.info(`result: ${arrayList2[0]}`); // 访问索引为0的元素。输出：result: 1
  // [StartExclude linear_container]
  logMsg = `result: ${arrayList2[0]}\n`;
  // [EndExclude linear_container]
  arrayList1[0] = 'one'; // 修改索引为0的元素
  console.info(`result: ${arrayList1[0]}`); // 输出：result: one
  // [StartExclude linear_container]
  logMsg += `result: ${arrayList1[0]}`;

}

function testDeque() {
  // [EndExclude linear_container]
  // Deque
  let deque1: Deque<string> = new  Deque<string>();
  deque1.insertFront('a'); // 头部增加一个值为'a'的元素
  let deque2: Deque<int> = new Deque<int>();
  deque2.insertFront(1); // 头部增加一个值为1的元素
  console.info(`result: ${deque2.getFirst()}`); // 访问队列首部的元素。输出：result: 1
  // [StartExclude linear_container]
  logMsg = `result: ${deque2.getFirst()}\n`;
  // [EndExclude linear_container]
  deque1.insertEnd('one'); // 尾部增加一个值为'one'的元素
  console.info(`result: ${deque1.getLast()}`); // 访问队列尾部的元素。输出：result: one
  // [StartExclude linear_container]
  logMsg += `result: ${deque1.getLast()}`;
}

function testStack() {
  // [EndExclude linear_container]
  // Stack
  let stack1: Stack<string> = new Stack<string>();
  stack1.push('a'); // 向栈里增加一个值为'a'的元素
  let stack2: Stack<int> = new Stack<int>();
  stack2.push(1); // 向栈里增加一个值为1的元素
  console.info(`result: ${stack1.peek()}`); // 访问栈顶元素。输出：result: a
  // [StartExclude linear_container]
  logMsg = `result: ${stack1.peek()}\n`;
  // [EndExclude linear_container]
  let popValue = stack2.pop()
  console.info(`result: ${popValue}`); // 删除栈顶元素并返回该删除元素。输出：result: 1
  // [StartExclude linear_container]
  logMsg += `result: ${popValue}\n`;
  // [EndExclude linear_container]
  console.info(`result: ${stack2.length}`); // 输出：result: 0
  // [StartExclude linear_container]
  logMsg += `result: ${stack2.length}`;
}

function testList() {
  // [EndExclude linear_container]
  // List
  let list1: List<string> = new List<string>();
  list1.add('a'); // 增加一个值为'a'的元素
  let list2: List<int> = new List<int>();
  list2.insert(0, 0); // 在0号位置插入（增加）一个值为0的元素
  let list3: List<Array<int>> = new List<Array<int>>();
  let b2 = [1, 2, 3];
  list3.add(b2); // 增加一个Array类型的元素
  console.info(`result: ${list1[0]}`); // 访问索引为0的元素。输出：result: a
  // [StartExclude linear_container]
  logMsg = `result: ${list1[0]}\n`;
  // [EndExclude linear_container]
  console.info(`result: ${list3.get(0)}`); // 访问索引为0的元素。输出：result: 1,2,3
  // [End linear_container]
  logMsg += `result: ${list3.get(0)}`;
}

@Entry
@Component
struct Index {
  @State width_value: string = '90%'
  @State height_value: string = '8%'
  @State log_msg: string = '未初始化'
  scroller: Scroller = new Scroller()

  build() {
    Row() {
      Scroll(this.scroller) {
        Column() {
          Text("日志信息")
            .fontSize(18)
            .fontWeight(600)
            .margin({ bottom: 12 })
          Text(this.log_msg)
            .fontSize(14)
            .fontColor('#ffb11616')
            .width('100%')
            .padding(10)
            .backgroundColor('#F0F0F0')
            .borderRadius(8)
          Button("ArrayList").onClick(() => {
            testArrayList();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')

          Button("Deque").onClick(() => {
            testDeque();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')

          Button("Stack").onClick(() => {
            testStack();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')

          Button("List").onClick(() => {
            testList();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
