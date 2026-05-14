| 测试功能    | 预置条件         | 输入             | 预期输出                  | 是否自动 | 测试结果 |
|:-------:|:------------:|:--------------:|:---------------------:|:----:|:----:|
| 拉起应用 | 设备正常运行 | | 成功拉起应用 | 是 | Pass |
| 主页展示 | 设备正常运行 | | 展示 createPixelMap Decode 和 createPicture 两个功能按钮 | 是 | Pass |
| 主页按钮点击 | 位于主页 | 点击 Go to Decode Page 按钮 | 跳转至 DecodePage 页面 | 是 | Pass |
| DecodePage 页面展示 | 位于 DecodePage 页面 | | 展示图片选择按钮（test.jpeg、test.png、test.bmp、test.webp、test.heic）、Decode Image (RawFile) 按钮和 Back 按钮 | 是 | Pass |
| DecodePage 选择 jpeg 图片 | 位于 DecodePage 页面 | 点击 test.jpeg 按钮 | 按钮高亮显示，显示"Selected: test.jpeg, click decode to process" | 是 | Pass |
| DecodePage 选择 png 图片 | 位于 DecodePage 页面 | 点击 test.png 按钮 | 按钮高亮显示，显示"Selected: test.png, click decode to process" | 是 | Pass |
| DecodePage 选择 bmp 图片 | 位于 DecodePage 页面 | 点击 test.bmp 按钮 | 按钮高亮显示，显示"Selected: test.bmp, click decode to process" | 是 | Pass |
| DecodePage 选择 webp 图片 | 位于 DecodePage 页面 | 点击 test.webp 按钮 | 按钮高亮显示，显示"Selected: test.webp, click decode to process" | 是 | Pass |
| DecodePage 选择 heic 图片 | 位于 DecodePage 页面 | 点击 test.heic 按钮 | 按钮高亮显示，显示"Selected: test.heic, click decode to process" | 是 | Pass |
| DecodePage 解码 jpeg 图片 | 位于 DecodePage 页面，已选择 test.jpeg | 点击 Decode Image (RawFile) 按钮 | 显示"Decode success!"，展示解码后的图片 | 是 | Pass |
| DecodePage 解码 png 图片 | 位于 DecodePage 页面，已选择 test.png | 点击 Decode Image (RawFile) 按钮 | 显示"Decode success!"，展示解码后的图片 | 是 | Pass |
| DecodePage 解码 bmp 图片 | 位于 DecodePage 页面，已选择 test.bmp | 点击 Decode Image (RawFile) 按钮 | 显示"Decode success!"，展示解码后的图片 | 是 | Pass |
| DecodePage 解码 webp 图片 | 位于 DecodePage 页面，已选择 test.webp | 点击 Decode Image (RawFile) 按钮 | 显示"Decode success!"，展示解码后的图片 | 是 | Pass |
| DecodePage 解码 heic 图片 | 位于 DecodePage 页面，已选择 test.heic | 点击 Decode Image (RawFile) 按钮 | 显示"Decode success!"，展示解码后的图片 | 是 | Pass |
| DecodePage 返回主页 | 位于 DecodePage 页面 | 点击 Back 按钮 | 返回主页 | 是 | Pass |
| 主页按钮点击 | 位于主页 | 点击 Go to Picture Page 按钮 | 跳转至 PicturePage 页面 | 是 | Pass |
| PicturePage 页面展示 | 位于 PicturePage 页面 | | 展示图片选择按钮（test.jpeg、test.heic）、Create Picture (RawFile) 按钮和 Back 按钮 | 是 | Pass |
| PicturePage 选择 jpeg 图片 | 位于 PicturePage 页面 | 点击 test.jpeg 按钮 | 按钮高亮显示，显示"Selected: test.jpeg, click create to process" | 是 | Pass |
| PicturePage 选择 heic 图片 | 位于 PicturePage 页面 | 点击 test.heic 按钮 | 按钮高亮显示，显示"Selected: test.heic, click decode to process" | 是 | Pass |
| PicturePage 创建 jpeg Picture | 位于 PicturePage 页面，已选择 test.jpeg | 点击 Create Picture (RawFile) 按钮 | 显示"Create Picture success!"，展示解码后的主 PixelMap 图片 | 是 | Pass |
| PicturePage 创建 heic Picture | 位于 PicturePage 页面，已选择 test.heic | 点击 Create Picture (RawFile) 按钮 | 显示"Create Picture success!"，展示解码后的主 PixelMap 图片 | 是 | Pass |
| PicturePage 返回主页 | 位于 PicturePage 页面 | 点击 Back 按钮 | 返回主页 | 是 | Pass |