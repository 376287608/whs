package com.ufgov.whs.attachment.bean;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 附件元数据实体类
 */
@Entity
@Table(name = "HAS_DOC")
public class HasDoc implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "DOC_ID")
    private String id;// 文件ID

    @Column(name = "DOC_NAME")
    private String docName;

    @Column(name = "DOC_SRC_NAME")
    private String docSrcName;

    @Column(name = "DOC_SIZE")
    private BigDecimal docSize;

    @Column(name = "HOST_ADDR")
    private String hostAddr;

    @Column(name = "SAVE_ADDR")
    private String saveAddr;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocSrcName() {
        return docSrcName;
    }

    public void setDocSrcName(String docSrcName) {
        this.docSrcName = docSrcName;
    }

    public BigDecimal getDocSize() {
        return docSize;
    }

    public void setDocSize(BigDecimal docSize) {
        this.docSize = docSize;
    }

    public String getHostAddr() {
        return hostAddr;
    }

    public void setHostAddr(String hostAddr) {
        this.hostAddr = hostAddr;
    }

    public String getSaveAddr() {
        return saveAddr;
    }

    public void setSaveAddr(String saveAddr) {
        this.saveAddr = saveAddr;
    }

}
