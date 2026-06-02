'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { Button, Column, ColumnOptions, Component, Entry, UIContext } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build(): void {
    Column({ space: 10 } as ColumnOptions) {
      Button('ShowFrameNodeTree')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeTree'
          })
        })
      Button('ShowFrameNodeMoveTo')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeMoveTo'
          })
        })
      Button('ShowFrameNodeCommon')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeCommon'
          })
        })
      Button('ShowFrameNodeDraw')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeDraw'
          })
        })
      Button('ShowFrameNodePosition')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodePosition'
          })
        })
      Button('ShowFrameNodeTypeNode')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeTypeNode'
          })
        })
      Button('ShowFrameNodeDisposed')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeDisposed'
          })
        })
      Button('ShowFrameNodeIsDisposed')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeIsDisposed'
          })
        })
      Button('ShowFrameNodeLazyForEach')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeLazyForEach'
          })
        })
      Button('ShowFrameNodeLazyForEachSelect')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeLazyForEachSelect'
          })
        })
      Button('ShowFrameNodeCanvas')
        .onClick(() => {
          const uiContext: UIContext = this.getUIContext();
          const router = uiContext.getRouter();
          router.pushUrl({
            url: 'pages/samples/FrameNodeCanvas'
          })
        })
    }.width('100%')
  }
}
