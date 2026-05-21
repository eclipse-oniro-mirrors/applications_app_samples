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

import { fileUtils } from '../utils/FileUtils';
import { logger } from '../utils/Logger';
import {
  Component, Builder, ForEach, NavPathStack, NavDestination, Navigation, NavPathInfo, Row, Column, List, ListItem,
  Image, Text, Button, NavigationTitleMode, NavigationMode, Color, ImageFit, TextAlign, ButtonType, ClickEvent, $r
} from '@ohos.arkui.component';
import { State, Link, Provide } from '@ohos.arkui.stateManagement';

const TAG: string = 'FileBrowse';
type StringArray = Array<string>;

@Component
export struct FileBrowse {
  @State folders: StringArray = ['folder'];
  @State files: StringArray = [''];
  @State currentFolder: string = '';
  @Link downloadDir: string;
  @Provide({ alias: 'pageStack' }) pageStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    fileUtils.listFolders(this.downloadDir).then((folders: string[]) => {
      this.folders = folders;
    })
  }

  @Builder
  NavDestinationBuilder(item: string): void {
    NavDestination() {
      this.FilesView();
    }
    .title(this.CustomTitle(item))
    .backgroundColor($r('app.color.light_gray'))
    .onReady(() => {
      this.currentFolder = item;
      fileUtils.listFiles(this.downloadDir, item).then((files: string[]) => {
        this.files = files;
      });
    })
  }

  @Builder
  build(): void {
    Navigation(this.pageStack, this.NavigationContent)
    .hideBackButton(false)
    .titleMode(NavigationTitleMode.Mini)
    .title($r('app.string.download_files_title'))
    .mode(NavigationMode.Stack)
    .backgroundColor($r('app.color.light_gray'))
    .navDestination(this.NavDestinationBuilder)
  }

  @Builder
  NavigationContent(): void {
    List() {
      this.ListContent()
    }
    .padding({ left: 12, right: 12 })
  }

  @Builder
  ListContent(): void {
    ForEach(this.folders, (item: string, index: int): void => {
      this.FolderListItem(item)
    })
  }

  @Builder
  FolderListItem(item: string): void {
    ListItem(undefined, (): void => {
      Row() {
        Image($r('app.media.ic_files_folder'))
          .size({ width: 32, height: 26 })
          .objectFit(ImageFit.Contain)
        Text(item)
          .fontSize(16)
          .width('100%')
          .margin({ left: 12 })
      }
      .height(56)
      .padding({ left: 16 })
      .backgroundColor(Color.White)
      .borderRadius(24)
      .onClick((event: ClickEvent): void => {
        this.pageStack.pushPath(new NavPathInfo(item, null));
      })
    })
  }

  @Builder
  CustomTitle(title: string): void {
    Row() {
      Text(title)
        .fontSize(20)
        .fontColor($r('app.color.text_normal'))
        .fontWeight(700)
        .margin({ left: 8 })
    }
    .width('100%')
  }

  @Builder
  FilesView(): void {
    Column() {
      this.FilesViewContent()
    }
    .height('100%')
    .backgroundColor($r('app.color.light_gray'))
  }

  @Builder
  FilesViewContent(): void {
    List() {
      this.FilesListContent()
    }
    .padding({ left: 12, right: 12 })
    .layoutWeight(1)

    Column() {
      this.ClearButtonContent()
    }
    .margin({ bottom: 24, top: 6 })
    .onClick(() => {
      fileUtils.clearFolder(this.downloadDir, this.currentFolder);
      this.files = [''];
    })
  }

  @Builder
  FilesListContent(): void {
    if (this.files.length <= 1 && this.files[0] === '') {
      ListItem(undefined, (): void => {
        Text($r('app.string.folder_empty'))
          .fontSize(16)
          .width('100%')
          .margin({ top: 50 })
          .textAlign(TextAlign.Center)
      })
    }
    ForEach(this.files, (item: string, index: int): void => {
      this.FileListItem(item)
    })
  }

  @Builder
  FileListItem(item: string): void {
    ListItem(undefined, (): void => {
      Text(decodeURIComponent(item))
        .fontSize(16)
        .width('100%')
    })
    .padding(12)
    .height(48)
    .backgroundColor(Color.White)
    .borderRadius(24)
  }

  @Builder
  ClearButtonContent(): void {
    Button() {
      Image($r('app.media.ic_public_delete'))
        .objectFit(ImageFit.Cover)
        .size({ width: 24, height: 24 })
    }
    .type(ButtonType.Circle)
    .width(40)
    .height(40)
    .backgroundColor('#FF0000')
    .margin({ left: 5 })

    Text($r('app.string.clear_folder'))
      .fontSize(14)
      .fontColor($r('app.color.text_normal'))
      .opacity(0.6)
      .margin({ top: 8 })
  }
}