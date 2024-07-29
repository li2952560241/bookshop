package com.daniel.pojo;

/*
 Page 的 POJO 类，用于表示分页信息。
 该类包含了三个属性：起始位置（start）、结束位置（end）和每页记录数（count）。
 还包含了一个方法 calculateEnd，用于根据总记录数计算分页的结束位置。
 */
public class Page {

    private int start = 0;
    private int end = 0;
    private int count = 16;

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void calculateEnd(int total) {
        if (total % count == 0) {
            this.end = total - count;
        }else {
            this.end = total - total % count;
        }
    }
}
