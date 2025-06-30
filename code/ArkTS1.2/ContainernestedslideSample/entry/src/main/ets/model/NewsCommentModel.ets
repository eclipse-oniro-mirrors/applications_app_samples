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
import { ResourceStr, Date, DataChangeListener, IDataSource } from '@ohos.arkui.component';

/**
 * 评论的数据结构
 */
export class NewsCommentModel {
  // 评论id
  public id: string;
  // 评论头像
  public url: ResourceStr;
  // 评论昵称
  public user: string;
  // 回复id
  public replyId: string;
  // 回复用户昵称
  public replyUser: string;
  // 回复文本
  public text: string;
  // 回复时间
  public commentTime: Date;
  // 评论下的回复列表

  constructor(id: string, url: ResourceStr, user: string, replyId: string,
    replyUser: string, text: string, commentTime: Date) {
    this.id = id;
    this.url = url;
    this.user = user;
    this.replyId = replyId;
    this.replyUser = replyUser;
    this.text = text;
    this.commentTime = commentTime;
  }
}