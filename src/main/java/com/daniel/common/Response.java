package com.daniel.common;

// 用于构建响应消息
public class Response {

    private static final String OK = "ok";
    private static final String ERROR = "error";

    private Meta meta;// 响应元数据
    private  Object data;// 响应数据

    //success()和success(Object data)方法用于构建成功响应，
    // 设置Meta的success属性为true，并可选地设置响应数据data。
    public Response success() {
        this.meta = new Meta(true,OK);
        return this;
    }

    public Response success(Object data) {
        this.meta = new Meta(true,OK);
        this.data = data;
        return this;
    }

    //failure()和failure(String message)方法用于构建失败响应，
    // 设置Meta的success属性为false，并可选地设置失败消息message
    public Response failure() {
        this.meta = new Meta(false, ERROR);
        return this;
    }

    public Response failure(String message) {
        this.meta = new Meta(false, message);
        return this;
    }

    //getMeta()和getData()方法分别用于获取响应的元数据和数据
    public Meta getMeta() {
        return meta;
    }

    public Object getData() {
        return data;
    }

    /**
     * 请求元数据
     */
    public class Meta {

        private boolean success;
        private String message;

        public Meta(boolean success) {
            this.success = success;
        }

        public Meta(boolean success, String message) {
            this.success = success;
            this.message = message;
        }

        public boolean isSuccess() {
            return success;
        }

        public String getMessage() {
            return  message;
        }
    }
}
