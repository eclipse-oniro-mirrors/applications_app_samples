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

import { UIContext } from '@ohos.arkui.UIContext';
import { Column, Row, TextInput, EditableTextOnChangeCallback, Button, ClickEvent, Padding,
  Margin, Entry, Component } from '@ohos.arkui.component';
import { AppStorage, State, MutableState, stateOf, observableProxy } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct CommentInputPage {
  @State text: string = '';

  build() {
    Row() {
      TextInput({ placeholder: '@', text: this.text })
        .layoutWeight(1)
        .height(40)
        .padding({ left: 10, right: 50, top: 3, bottom: 3 } as Padding)
        .onChange((textInComment: string) => {
          this.text = textInComment;
        } as EditableTextOnChangeCallback)

      Button('发布')
        .width(60)
        .height(30)
        .borderRadius(15)
        .backgroundColor('#ed394b')
        .fontColor('#ffffff')
        .margin({ left: 10 } as Margin)
        .onClick((e: ClickEvent) => {
          AppStorage.setOrCreate('PropA', this.text);
          this.getUIContext().getRouter().back();
        })
    }
    .width('100%')
    .padding(10)
    .height(50)
  }
}