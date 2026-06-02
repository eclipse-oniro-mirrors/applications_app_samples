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

// [Start NativeCreate]
import {
  Entry, Text, Column, Component, Button, ClickEvent, Row, ContentSlot, State, Watch, NodeContent
} from '@kit.ArkUI';
import hilog from '@ohos.hilog';
import { NativeClass } from './NativeClass';

@Entry
@Component
struct Index {
  // 初始化NodeContent对象
  private rootSlot: NodeContent = new NodeContent();
  @State @Watch('changeNativeFlag') showNative: boolean = false;
  calc: NativeClass = new NativeClass()

  changeNativeFlag(name: string): void {
    if (this.showNative) {
      // 传递NodeContent对象用于Native创建组件的挂载显示
      this.calc.createNativeRoot(this.rootSlot)
    } else {
      // 销毁NativeModule组件
      this.calc.destroyNativeRoot()
    }
  }

  build() {
    Column() {
      Button(this.showNative ? 'Hide Native UI' : 'Show Native UI')
        .onClick(() => {
          this.showNative = !this.showNative
        })
        .id('btn')
      Row() {
        // 将NodeContent和ContentSlot占位组件绑定
        ContentSlot(this.rootSlot)
      }.layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
// [End NativeCreate]