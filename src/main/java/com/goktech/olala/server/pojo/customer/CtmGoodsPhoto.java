package com.goktech.olala.server.pojo.customer;

public class CtmGoodsPhoto {
    private Long id;

    private String localpath;

    private Integer categoryId;

    private String title;

    private String smptitle;

    private String kind;

    private String sortvalue;

    private String starttime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLocalpath() {
        return localpath;
    }

    public void setLocalpath(String localpath) {
        this.localpath = localpath == null ? null : localpath.trim();
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getSmptitle() {
        return smptitle;
    }

    public void setSmptitle(String smptitle) {
        this.smptitle = smptitle == null ? null : smptitle.trim();
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind == null ? null : kind.trim();
    }

    public String getSortvalue() {
        return sortvalue;
    }

    public void setSortvalue(String sortvalue) {
        this.sortvalue = sortvalue == null ? null : sortvalue.trim();
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime == null ? null : starttime.trim();
    }

    @Override
    public String toString() {
        return "CtmGoodsPhoto{" +
                "id=" + id +
                ", localpath='" + localpath + '\'' +
                ", categoryId=" + categoryId +
                ", title='" + title + '\'' +
                ", smptitle='" + smptitle + '\'' +
                ", kind='" + kind + '\'' +
                ", sortvalue='" + sortvalue + '\'' +
                ", starttime='" + starttime + '\'' +
                '}';
    }
}