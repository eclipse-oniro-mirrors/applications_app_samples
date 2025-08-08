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

import { Entry,
  Row,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  TextArea,
  Scroll } from '@ohos.arkui.component';
import { State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { ArrayBlockingQueueTest } from './containers/ArrayBlockingQueueTest';
import { ConcurrentHashMapTest } from './containers/ConcurrentHashMapTest';
import { ConcurrentSetTest } from './containers/ConcurrentSetTest';
import { LinkedBlockingQueueTest } from './containers/LinkedBlockingQueueTest';

@Entry
@Component
struct MyStateSample {
  @State logs: Array<string> = new Array<string>();
  @State logsString1: string = '';
  @State logsString2: string = '';
  @State logsString3: string = '';
  @State logsString4: string = '';

  @State container1: string = 'ArrayBlockingQueue';
  @State container2: string = 'ConcurrentSet';
  @State container3: string = 'ConcurrentHashMap';
  @State container4: string = 'LinkedBlockingQueue';

  build() {
    Scroll() {
      Column(undefined) {
        Text(this.container1)
          .fontSize(22)
        Button('场景一：接口调用')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let arrayQueue = new ArrayBlockingQueueTest();
            this.logsString1 = arrayQueue.basicScene().join(`\n`);
          })
        Button('场景二：并发入队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let arrayQueue = new ArrayBlockingQueueTest();
            this.logsString1 = arrayQueue.concurrentInQueue().join(`\n`);
          })
        Button('场景三：并发出队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let arrayQueue = new ArrayBlockingQueueTest();
            this.logsString1 = arrayQueue.concurrentOutQueue().join(`\n`);
          })
        Button('场景四：队列为空时阻塞')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let arrayQueue = new ArrayBlockingQueueTest();
            this.logsString1 = arrayQueue.nullBlocking().join(`\n`);
          })
        TextArea({ text: this.logsString1 })
          .fontSize(16)
          .width('80%')
          .height(180)
        Text(this.container2)
          .fontSize(22)
          .margin(30)
        Button('场景一：接口调用')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let set = new ConcurrentSetTest();
            this.logsString2 = set.basicScene().join(`\n`);
            hilog.info(0x0000, 'testTag', 'ConcurrentSetTest this.logsString2 ' + this.logsString2);
          })
        Button('场景二：并列入队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let set = new ConcurrentSetTest();
            this.logsString2 = set.concurrentInSet().join(`\n`);
            hilog.info(0x0000, 'testTag', 'ConcurrentSetTest this.logsString2 ' + this.logsString2);
          })
        Button('场景三：并列出队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let set = new ConcurrentSetTest();
            this.logsString2 = set.concurrentOutSet().join(`\n`);
            hilog.info(0x0000, 'testTag', 'ConcurrentSetTest this.logsString2 ' + this.logsString2);
          })
        TextArea({ text: this.logsString2 })
          .fontSize(16)
          .width('80%')
          .height(180)
        Text(this.container3)
          .fontSize(22)
          .margin(30)
        Button('场景一：接口调用')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let map = new ConcurrentHashMapTest();
            this.logsString3 = map.basicScene().join(`\n`);
          })
        Button('场景二：并列入队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let map = new ConcurrentHashMapTest();
            this.logsString3 = map.concurrentInQueue().join(`\n`);
          })
        Button('场景三：并列出队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let map = new ConcurrentHashMapTest();
            this.logsString3 = map.concurrentOutQueue().join(`\n`);
          })
        Button('场景四：Benchmark')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            let map = new ConcurrentHashMapTest();
            this.logsString3 = map.hashMapBenchmark();
          })
        TextArea({ text: this.logsString3 })
          .fontSize(16)
          .width('80%')
          .height(180)
        Text(this.container4)
          .fontSize(22)
          .margin(30)
        Button('场景一：接口调用')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            this.logsString4 = '';
            let linkedQueue = new LinkedBlockingQueueTest();
            this.logsString4 = linkedQueue.basicScene().join(`\n`);
            hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest this.logsString4 ' + this.logsString4);
          })
        Button('场景二：并列入队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            this.logsString4 = '';
            let linkedQueue = new LinkedBlockingQueueTest();
            this.logsString4 = linkedQueue.concurrentInQueue().join(`\n`);
            hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest this.logsString4 ' + this.logsString4);

          })
        Button('场景三：并列出队')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            this.logsString4 = '';
            let linkedQueue = new LinkedBlockingQueueTest();
            this.logsString4 = linkedQueue.concurrentOutQueue().join(`\n`);
            hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest this.logsString4 ' + this.logsString4);

          })
        Button('场景四：队列满时阻塞')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            this.logsString4 = '';
            let linkedQueue = new LinkedBlockingQueueTest();
            this.logsString4 = linkedQueue.fullBlocking().join(`\n`);
            hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest this.logsString4 ' + this.logsString4);

          })
        Button('场景五：队列空时阻塞')
          .fontSize(18)
          .margin(5)
          .onClick((e: ClickEvent) => {
            this.logsString4 = '';
            let linkedQueue = new LinkedBlockingQueueTest();
            this.logsString4 = linkedQueue.nullBlocking().join(`\n`);
            hilog.info(0x0000, 'testTag', 'LinkedBlockingQueueTest this.logsString4 ' + this.logsString4);

          })
        TextArea({ text: this.logsString4 })
          .fontSize(16)
          .width('80%')
          .height(180)
      }.width('100%')
    }
  }
}