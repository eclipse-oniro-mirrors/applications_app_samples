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

#ifndef IMAGEEFFECT_RENDER_TEXTURE_H
#define IMAGEEFFECT_RENDER_TEXTURE_H

#include "gl_utils.h"

// 渲染纹理封装，负责2D纹理的创建与释放。
class RenderTexture {
public:
    RenderTexture(GLsizei width, GLsizei height, GLenum internalFormat = GL_RGBA8)
    {
        internalFormat_ = internalFormat;
        width_ = width;
        height_ = height;
    }

    ~RenderTexture()
    {
        Release();
    }

    bool IsReady() const
    {
        return isReady_;
    }

    void SetReady(bool flag)
    {
        isReady_ = flag;
    }

    GLsizei Width() const
    {
        return width_;
    }

    GLsizei Height() const
    {
        return height_;
    }

    GLenum Format() const
    {
        return internalFormat_;
    }

    GLuint GetName() const
    {
        return name_;
    }

    bool Init()
    {
        if (!IsReady()) {
            name_ = GLUtils::CreateTexture2D(width_, height_, 1, internalFormat_);
            SetReady(name_ != 0);
        }
        return isReady_;
    }

    bool Release()
    {
        GLUtils::DeleteTexture(name_);
        name_ = GL_ZERO;
        SetReady(false);
        return true;
    }

private:
    GLuint name_ = GL_ZERO;
    GLsizei width_ = 0;
    GLsizei height_ = 0;
    GLenum internalFormat_ = GL_RGBA8;
    bool isReady_ = false;
};

#endif // IMAGEEFFECT_RENDER_TEXTURE_H
