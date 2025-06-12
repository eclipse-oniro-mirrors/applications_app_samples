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
import {
  memo,
  __memo_context_type,
  __memo_id_type
} from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins
import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView,
  Row,
  TextAlign,
  Visibility,
  List,
  ListItem,
  ForEach,
  TextOverflow,
  Image,
  HorizontalAlign,
  Progress,
  ProgressType,
  FlexAlign,
  SafeAreaType,
  JSON,
  $r,
  Margin
} from '@ohos.arkui.component'; // TextAttribute should be insert by ui-plugins
import {
  State,
  Link,
  StateDecoratedVariable,
  MutableState,
  stateOf,
  observableProxy,
  Prop,
  Watch
} from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins\
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { HistoryItem } from './HistoryItem';
import request from '@ohos.request'; // 导入上传下载模块。需要配置ohos.permission.INTERNET权限
import { downloadFilesData } from '../model/dataType';
import util from '@ohos.util';

const NO_TASK: number = 0; // 0个下载任务
const INIT_PROGRESS: number = 0; // 进度条初始值
const BYTE_CONVERSION: number = 1024; // 字节转换

/**
 * 功能描述: 多文件下载监听在应用开发中是一个非常常见的需求。本示例将介绍如何使用request上传下载模块实现多文件下载监听，如监听每个文件下载任务的进度，任务暂停，下载完成等下载情况。
 *         每个应用最多支持创建10个未完成的任务，相关规格说明请参考request.agent.create。
 *
 * 推荐场景: 多文件下载
 *
 * 核心组件:
 * 1. FileDownloadItem
 *
 * 实现步骤：
 * 1.配置下载参数。一个下载任务需要配置对应一套下载参数request.agent.Config。本例中使用downloadConfig方法简单配置了下载文件的url，实际业务
 * 中请按实际情况按需配置。
 * 2.创建多个文件下载监听实例。单个文件下载监听只需要配置下载参数，创建下载任务，注册下载任务相关监听，启动下载任务即可实现。而要实现多文件下载监听，
 * 需要每个下载任务注册独立的下载监听回调。本例通过封装自定义组件FileDownloadItem，在每个FileDownloadItem中创建各自的下载任务和监听回调，从
 * 而实现多文件下载监听。
 * 3.创建下载任务，并注册下载任务相关监听。本例在每个FileDownloadItem中使用request.agent.create创建下载任务。然后在下载任务创建成功后，注
 * 册各自下载任务相关监听。本例中注册了下载任务完成回调，下载任务失败回调，下载进度更新回调，暂停任务回调，重新启动任务回调。
 * 4.启动下载任务。本例在每个FileDownloadItem中使用task.start方法启动各自的下载任务。
 * 5.本例中下载任务用到的其他操作：使用request.agent.show，根据任务id可查询任务的详细信息。使用task.pause可以暂停正在等待WAITING/正在运行
 * RUNNING/正在重试RETRYING的后台下载任务。使用task.resume可以重新启动任务，可恢复暂停的后台任务。
 */

@Entry
@Component
export struct MultipleFilesDownloadComponent {
  @State message: string = '待下载';
  // 是否全部开始下载
  @State isStartAllDownload: boolean = false;
  // 待下载任务数量
  @State downloadCount: number = 0;
  // 下载失败任务数量。当所有任务下载失败时，'全部暂停'状态重置为'全部开始'。
  @State downloadFailCount: number = 0;
  // 下载列表内容透明度。用于控制是否显示下载列表相应内容
  @State downloadPageOpacity: number = 1;
  // 下载列表内容使能控制。避免隐藏后还能点击
  @State isDownloadPageEnabled: boolean = true;
  // 历史列表的显隐控制。
  @State historyPageVisibility: Visibility = Visibility.None;
  // 历史列表内容使其能控制。避免隐藏后还能点击
  @State isHistoryPageEnabled: boolean = false;
  // 点击历史列表tab时，控制下载列表相应的内容的显隐
  @State downloadPageVisibility: Visibility = Visibility.Visible;
  // 下载列表数据
  @State downloadFileArray: downloadFilesData[] = new Array<downloadFilesData>();
  // 下载历史列表数据
  @State historyList: downloadFilesData[] = new Array<downloadFilesData>();
  // 下载文件名
  @State fileName: string = '文件名';
  // 下载任务状态
  @State state: string = '';
  // 下载状态图标显隐控制。下载中显示图标，下载完成或者下载失败隐藏图标
  @State isShow: boolean = false;
  // 是否正在下载标志位
  @State downloading: boolean = false;
  // 下载文件大小。类型字符串
  @State sFileSize: string = '-';
  // 下载文件大小。类型数值
  @State nFileSize: number = 0;
  // 当前已下载数据量。类型字符串
  @State sCurrentDownloadSize: string = '-';
  // 当前已下载数据量。类型数值
  @State nCurrentDownloadSize: number = 0;
  // 下载任务对象初始化。用于下载失败和下载过程中暂停和重新启动下载。
  private downloadTask: request.agent.Task | undefined;

  // 下载信息初始化
  aboutToAppear(): void {
    this.downloadFileArray = [
      {
        'id': '1',
        'url': '这里改为下载文件路径',
        'fileStatus': 0,
        'downloadTime': 1728529510880
      },
      {
        'id': '2',
        'url': '这里改为下载文件路径',
        'fileStatus': 0,
        'downloadTime': 1728529510880
      },
      {
        'id': '3',
        'url': '这里改为下载文件路径',
        'fileStatus': 0,
        'downloadTime': 1728529510880
      },
      {
        'id': '4',
        'url': '这里改为下载文件路径',
        'fileStatus': 0,
        'downloadTime': 1728529510880
      }
    ]
    // 下载数量，用于显示页面上下载队列数量
    this.downloadCount = this.downloadFileArray.length;
  }

  // 监听是否开始下载/暂停下载
  onDownLoadUpdated(): void {
    if (this.isStartAllDownload) {
      this.startAllDownloads();
    }
  }

  startAllDownloads() {
    this.downloadFileArray.forEach((item: downloadFilesData) => {
      this.startDownload(item.url);
    })
  }

  // 启动下载任务
  startDownload(url: string) {
    // 首次下载，创建任务
    let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    (request.agent.create(context, {
      action: request.agent.Action.DOWNLOAD, // 配置任务选项，这里配置为下载任务
      url: url, // 配置下载任务url
      overwrite: true, // 下载过程中路径已存在时的解决方案选择。true表示覆盖已存在的文件
      method: 'GET', // HTTP标准方法。下载时，使用GET或POST。
      saveas: './', // 这里'./'表示下载至应用当前缓存路径下。
      mode: request.agent.Mode.BACKGROUND, // 任务模式设置后台任务。
      gauge: true, // 后台任务的过程进度通知策略，仅应用于后台任务。true表示发出每个进度已完成或失败的通知。
      retry: false, // 默认为true，如果没有网络或者网络不满足时，会自动暂停waiting，等网络满足时进行一次重试。设置为false时，没网直接走失败回调
    } as request.agent.Config) as Promise<request.agent.Task>)
      .then((task: request.agent.Task) => {
        // 注册下载任务相关回调
        task.on('completed', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'TAGhttp', `下载完成`);
        }); // 下载任务完成回调
        task.on('progress', this.progressCallback); // 下载进度更新回调
        task.on('failed', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'TAGhttp', `下载失败`);
        }); // 下载任务失败回调

        task.on('resume', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'TAGhttp', `重新启动`);
        }); // 重新启动任务回调

        task.on('pause', (progress: request.agent.Progress) => {
          hilog.info(0x0000, 'TAGhttp', `暂停`);
        }); // 暂停任务回调

        // TODO 知识点：启动下载任务。本例在每个FileDownloadItem中使用task.start方法启动各自的下载任务。
        task.start((err: BusinessError) => {
          if (err) {
            hilog.info(0x0000, 'TAGhttp',
              `Failed to task start with error message: ${err.message}, error code: ${err.code}`);
            return;
          }
          this.downloadTask = task as request.agent.Task;
        })
      })
  }

  // 下载进度更新回调
  private progressCallback: (progress: request.agent.Progress) => void = (progress: request.agent.Progress) => {
    // 性能知识点: 如果注册了progress下载进度更新监听，不建议在progress下载进度更新回调中加日志打印，减少不必要的性能损耗。
    this.state = '下载中';
    this.downloading = true;
    // 显示下载状态图标
    this.isShow = true;
    // 第一次开始下载
    if (this.sFileSize === '-') {
      // 如果下载url文件的服务器采用chunk分块传输文件数据，是获取不到下载文件总大小的。传过来的值为-1，则在页面上显示'未知大小'
      if (progress.sizes[0] === -1) {
        this.sFileSize = '未知大小';
        // 文件大小无法获取的情况下，进度条的值设置为0，总进度设置为1
        this.nCurrentDownloadSize = 0;
        this.nFileSize = 1;
      } else {
        // 能获取文件大小时，按实际下载数据量更新进度
        this.nFileSize = progress.sizes[0];
        hilog.info(0x0000, 'TAGhttp', `nFileSize: ` + String(this.nFileSize));
        this.sFileSize = (progress.sizes[0] / BYTE_CONVERSION) + 'kb';
        hilog.info(0x0000, 'TAGhttp', `sFileSize: ` + String(this.sFileSize));
        this.nCurrentDownloadSize = progress.processed;
        hilog.info(0x0000, 'TAGhttp', `nCurrentDownloadSize: ` + String(this.nCurrentDownloadSize));
      }
    } else if (this.sFileSize === '未知大小') {
      // 非首次下载(暂停过下载任务后重新启动下载时)，文件大小未知情况时，下载时进度不做更新
      hilog.info(0x0000, 'TAGhttp', `When the file size is unknown, the download progress will not be updated`);
    } else {
      // 非首次下载(暂停过下载任务后重新启动下载时)，文件大小能获取到的情况，更新下载进度
      this.nCurrentDownloadSize = progress.processed;
    }
    // 用于显示已下载文件数据大小
    this.sCurrentDownloadSize = (progress.processed / BYTE_CONVERSION) + 'kb';
  }

  build() {
    Column() {
      Text($r('app.string.router_back'))
        .fontSize(20)
        .width('100%')
        .onClick((): void => {
          this.getUIContext().getRouter().back();
        })

      Text($r('app.string.multiple_files_download_transfer_list'))
        .fontSize(25)
        .textAlign(TextAlign.Center)
      Row() {
        Text($r('app.string.multiple_files_download_list'))
          .fontSize(16)
          .fontColor(this.downloadPageOpacity === 1 ? '#FFFFFF' : '#808080')
          .textAlign(TextAlign.Center)
          .backgroundColor(this.downloadPageOpacity === 1 ? '#007DFF' : '#E8E8E8')
          .width('49%')
          .height(35)
          .borderRadius(50)
          .margin(3)
          .onClick((e: ClickEvent) => {
            this.downloadPageOpacity = 1;
            this.isDownloadPageEnabled = true;
            this.downloadPageVisibility = Visibility.Visible;
            this.historyPageVisibility = Visibility.None;
            this.isHistoryPageEnabled = false;
          })

        Text($r('app.string.multiple_files_download_album_backup'))
          .fontSize(16)
          .fontColor(this.downloadPageOpacity === 1 ? '#808080' : '#FFFFFF')
          .textAlign(TextAlign.Center)
          .backgroundColor(this.downloadPageOpacity === 1 ? '#E8E8E8' : '#007DFF')
          .width('49%')
          .height(35)
          .borderRadius(50)
          .margin(3)
          .onClick((e: ClickEvent) => {
            this.downloadPageOpacity = 0;
            this.isDownloadPageEnabled = false;
            this.downloadPageVisibility = Visibility.None;
            this.historyPageVisibility = Visibility.Visible;
            this.isHistoryPageEnabled = true;
          })
      }
      .width('100%')
      .backgroundColor('#E8E8E8')
      .borderRadius(50)
      .margin(20)

      Row() {
        Row() {
          Text($r('app.string.multiple_files_download_queue')).fontSize(20)
          Text(this.downloadCount + '').fontSize(20)
        }.width('50%')

        Row() {
          Text(this.isStartAllDownload && this.downloadCount > NO_TASK ? '全部暂停' : '全部开始')
            .fontSize(20)
            .fontColor('#418AF3')
            .textAlign(TextAlign.End)
            .width('100%')
            .id('download')
            .onClick((): void => {
              if (this.downloadCount === NO_TASK) {
                return;
              }
              this.isStartAllDownload = !this.isStartAllDownload;
              this.onDownLoadUpdated()
            })
        }.width('50%')
      }
      .opacity(this.downloadPageOpacity)
      .visibility(this.downloadPageVisibility)
      .enabled(this.isDownloadPageEnabled)
      .width('100%')

      List() {
        ForEach(this.downloadFileArray, (item: downloadFilesData) => {
          ListItem() {
            Row() {
              Row() {
                Image($r('app.media.multiple_files_download_file'))
                  .height(50)
                  .width(50)
                  .borderRadius(8)
                  .id('fileImage')
              }.width('17%')

              Column() {
                Row() {
                  Column() {
                    Text(this.fileName)
                      .height(22)
                      .width('100%')
                      .fontSize(14)
                      .fontColor('#000000')
                      .textAlign(TextAlign.Start)
                      .maxLines(1)// 限制为单行
                      .id('fileName')

                    Row() {
                      Text(this.sCurrentDownloadSize + '/' + this.sFileSize + 'MB  ')
                        .fontSize(12)
                        .fontColor('#66182431')
                        .id('downloadVal')

                      Text(this.state)
                        .fontSize(12)
                        .fontColor('#66182431')
                        .id(this.fileName + 'state')
                    }.width('100%')
                    .height(23)
                  }
                  .width('90%')

                  Image($r('app.media.multiple_files_download_start'))
                    .height(25)
                    .width('10%')
                    .id('downloadImage')
                }

                // 下载进度条，用于显示从下载进度更新回调中获取到的已下载数据大小
                Progress({ value: INIT_PROGRESS, total: this.nFileSize, type: ProgressType.Capsule })
                  .value(1)
                  .height(5)
                  .id('progress')

              }
              .width('83%')
              .height(50)
              .alignItems(HorizontalAlign.Start)
            }
            .width('100%')
            .height(50)
            .margin({ top: 15, bottom: 15 } as Margin)
          }
        }, (item: downloadFilesData) => item.id)
      }
      .opacity(this.downloadPageOpacity)
      .visibility(this.downloadPageVisibility)
      .enabled(this.isDownloadPageEnabled)
      .width('100%')
      .height('80%')

      // 下载历史列表
      List() {
        ForEach(this.downloadFileArray, (item: downloadFilesData) => {
          ListItem() {
            HistoryItem({
              downloadCount: this.downloadCount, // 待下载任务数量
              historyArray: this.historyList,
              downloadFileArray: this.downloadFileArray // 下载文件数据源
            })
          }.onClick((): void => {
            hilog.info(0x0000, 'testTag', '点击单个文件');
          })
        })
      }.visibility(this.historyPageVisibility)
      .enabled(this.isHistoryPageEnabled)
      .width('100%')
      .height('80%')

    }.padding(15)
    .width('100%')
    .height('100%')
  }
}