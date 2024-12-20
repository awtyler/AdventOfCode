//
//  Input.swift
//  Day8
//
//  Created by Aaron Tyler on 11/3/23.
//

import Foundation

enum Input {
    
    enum InputType {
        case sample
        case real
    }

    static var executionPart: ExecutionPart = .part1
    static var inputType: InputType = .sample
    
    static var input: String {
        if inputType == .sample {
            return input_sample
        }
        return input_real
    }
    
    // USE CMD-OPT-E to select multiple placeholders with the same name
    static func getInput() -> Map {
        var lines = input.linesToStringArray()

        let instructions = lines.remove(at: 0).split(separator: "").map { Direction(rawValue: String($0))! }
//        lines.remove(at: 0) // Remove empty line
        
        var locations: [Location] = []
        for line in lines {
            locations.append(Location(line))
        }
        
        let map = Map(instructions: instructions, locations: locations)
        
//        print("INSTRUCTIONS: ", instructions)
//        print("LOCATIONS: ", locations)
        
        return map
    }
    
    static let input_sample = """
    LR

    11A = (11B, XXX)
    11B = (XXX, 11Z)
    11Z = (11B, XXX)
    22A = (22B, XXX)
    22B = (22C, 22C)
    22C = (22Z, 22Z)
    22Z = (22B, 22B)
    XXX = (XXX, XXX)
    """
    
    static let input_real = """
    LRRLLRRLLRRRLRLRRLRLRLRRLRLRLRLLLRRRLRLRRLLRLRRRLRRRLRLRLRRRLLRRLLRLRLRRRLRLLRRRLRLLRLRRRLRLRRRLRRRLLRRRLLRRRLRRLRRRLLRRRLRRLRRLRRLLRLRRLRRLRRRLRLRLRLRLRLRRRLLRLRRLRLRRLLRRLLRLRRLRRRLRLRLRLRRRLRRLRRLRRLRRLRRLRLRRRLRRRLRRRLRLRLLRRLRRRLRRLRLRRRLRRLRRRLRRLLRRLLLRRRR

    GSC = (CLG, RPF)
    NTQ = (RMN, HLB)
    LTX = (XFB, CGP)
    RHK = (KRS, TPX)
    KPK = (PRP, MKG)
    NKV = (BHD, DQJ)
    JNK = (RXN, BQX)
    JXJ = (JFK, CCS)
    LDC = (JBF, PHQ)
    QRS = (VPM, FDD)
    XRL = (SQT, VGH)
    VQN = (BRP, VCF)
    NBP = (GKC, HKC)
    FCH = (KLN, RQV)
    BQT = (KKX, RNZ)
    SVN = (JGN, FSL)
    FPL = (SDB, VQV)
    RMQ = (CCV, JST)
    DRB = (MSM, VHX)
    DDF = (GHC, PSX)
    GLR = (LFR, THG)
    DGL = (JGQ, DHD)
    RFQ = (BXJ, SRQ)
    XTG = (XBB, TQJ)
    PCL = (DDK, GNC)
    FVG = (JKL, CRC)
    GXQ = (CBS, RJS)
    SDR = (LFR, THG)
    KBM = (PCV, DBP)
    XPJ = (GCS, GJD)
    XRG = (LNK, KQL)
    FPQ = (TPG, MQQ)
    MSM = (LQG, KRF)
    LFR = (THX, GFC)
    KQK = (FQH, FCH)
    HPH = (HHJ, VKM)
    DHC = (QGV, FNH)
    PQQ = (KKX, KKX)
    TNQ = (LXD, KNG)
    QNB = (TLX, VLF)
    VKX = (BJL, GQB)
    DTM = (KRQ, CLV)
    BHS = (LFH, TVV)
    MCJ = (BFJ, FCS)
    CGQ = (MRH, SBD)
    FBM = (RXQ, CFR)
    NLQ = (QSD, LFZ)
    VSK = (DGR, DFT)
    HJG = (TFV, XJL)
    XFB = (NKP, FBF)
    JGL = (RGS, KTD)
    MHS = (BNM, KSK)
    RMG = (QNB, MHL)
    XSX = (XBG, GVD)
    FMV = (LVV, CQR)
    CRK = (TRN, KKG)
    VQV = (BPB, RFL)
    THN = (QVH, DVT)
    GNT = (RGS, KTD)
    DCH = (GJD, GCS)
    KTD = (LSF, MJC)
    BDC = (FDH, MSK)
    PRQ = (JGL, GNT)
    PSR = (DHF, FPL)
    XBB = (FRR, GSC)
    SFB = (HGX, DFS)
    VTJ = (HFH, KXN)
    KJV = (TKP, THL)
    BFF = (PLM, DGC)
    VBV = (XDK, LLS)
    KMV = (XDS, VQT)
    JPD = (BHL, QJF)
    DGR = (MTT, JCG)
    PGK = (VCX, NLQ)
    BFJ = (FHX, QFR)
    VSF = (VKX, CTP)
    PFJ = (BRP, VCF)
    XVN = (VCX, VCX)
    JQG = (SKM, THM)
    CXS = (CRC, JKL)
    RFL = (NNT, DMH)
    RBH = (KHM, PLR)
    PNT = (JCQ, XSR)
    XHK = (GJK, BLQ)
    CFR = (FHC, CTD)
    JPP = (JFD, FPB)
    RRT = (VVM, NFB)
    RPF = (TKG, KVK)
    JTF = (FBT, DLL)
    PSX = (PDS, JPD)
    TCH = (TDN, FRB)
    RHT = (VNR, NHB)
    TQJ = (GSC, FRR)
    MCK = (NJD, XDX)
    NPH = (XQF, NSL)
    LQQ = (LCM, PHH)
    VSV = (SFT, MVL)
    KRS = (TGR, TGR)
    DRR = (JXT, TSF)
    QRQ = (NTG, MTL)
    PJB = (RMN, HLB)
    VFC = (KPH, PKM)
    FHC = (CJM, FTQ)
    DRC = (RBC, THN)
    TRB = (JHX, LSC)
    GCS = (TRB, MDB)
    RCG = (MFT, FXM)
    HCB = (LHB, JGH)
    BFN = (RMG, KJH)
    TPG = (NGM, XHQ)
    JCS = (VGS, NSN)
    SGT = (LHX, MPF)
    NXM = (VPH, KGV)
    XNC = (LTX, PHJ)
    DNT = (KLS, RNC)
    JGN = (TNN, BXD)
    QJX = (XPJ, DCH)
    LQP = (FRK, NFS)
    HCL = (GBS, PGB)
    FDD = (XQJ, XTS)
    XTS = (TJL, LGJ)
    HLR = (TBR, FPG)
    DLL = (VJV, MJN)
    LFH = (VBM, MHT)
    LMD = (VGG, RHK)
    JKL = (CMQ, QCN)
    DDP = (GTH, HKM)
    VNL = (VVL, CFP)
    SGB = (MKL, DVQ)
    KBJ = (BDF, SXQ)
    DVT = (NMB, LCB)
    XQJ = (TJL, LGJ)
    HLB = (XHH, XNC)
    VPT = (BRF, JPP)
    PDS = (QJF, BHL)
    CGG = (PLS, SNM)
    SDB = (RFL, BPB)
    DVQ = (XSX, KXQ)
    XQS = (BPF, XLV)
    CDG = (XKV, HMT)
    JCG = (CFK, RPR)
    RBC = (DVT, QVH)
    BJB = (MVC, KXL)
    LFZ = (HTT, QTF)
    FTQ = (RLM, LMQ)
    TCT = (FPH, FCC)
    QXL = (BPF, XLV)
    MXX = (BHX, QNX)
    LSR = (FFJ, DMT)
    RTD = (KBS, GDV)
    TXH = (QBQ, NSF)
    CSB = (CBP, QDQ)
    GBS = (BRN, GXP)
    GMX = (LHX, MPF)
    JQV = (GMX, SGT)
    GML = (GLR, SDR)
    GCG = (RHT, KTF)
    RPR = (XTG, JGT)
    NDG = (QFD, HTD)
    KBK = (VFP, BSC)
    FVB = (RFQ, LLH)
    CGP = (NKP, FBF)
    RXQ = (FHC, CTD)
    KQD = (CJN, DRR)
    QTF = (FVH, TRV)
    QDQ = (FBM, SLV)
    NMT = (JST, CCV)
    BHC = (RJM, SVN)
    GMR = (LNT, XFP)
    MSK = (VQN, PFJ)
    CBV = (CGB, PGV)
    MHT = (GMC, RSH)
    BRN = (KQK, FXV)
    XXM = (JGL, GNT)
    VLF = (VNN, RRV)
    FDH = (VQN, PFJ)
    NFD = (MGN, GLL)
    THM = (PLL, VTJ)
    MPF = (JVN, DFC)
    BNG = (RNC, KLS)
    LGJ = (QHV, XBR)
    QTJ = (TVT, NBP)
    KRQ = (MDF, RLN)
    PCK = (CCS, JFK)
    DQV = (FLD, CSB)
    HDD = (FGX, XRG)
    TFL = (DQV, CJQ)
    BNM = (KMV, CVX)
    MLC = (CFP, VVL)
    SBD = (MKD, DKP)
    PSK = (DBV, BSF)
    FRB = (BBD, TPB)
    RKL = (HVK, DRN)
    HMZ = (DRR, CJN)
    LJK = (LBN, DDG)
    LSC = (MXX, VFX)
    TDN = (TPB, BBD)
    RNX = (FBT, DLL)
    QGJ = (KTS, RBF)
    RFB = (BCF, MHS)
    VGN = (TJP, VSF)
    HFH = (FPQ, PGF)
    HXX = (QFD, HTD)
    RJS = (PCK, JXJ)
    TRQ = (GCG, GQF)
    KXN = (FPQ, PGF)
    FMS = (XJL, TFV)
    NMB = (QRQ, DGD)
    BPF = (VMX, GXQ)
    HCX = (XSR, JCQ)
    RJR = (BNG, DNT)
    BQX = (GQC, VLX)
    DHD = (RLC, GVS)
    DQJ = (HJG, FMS)
    QFD = (TNQ, HSF)
    HMT = (HSG, MHM)
    BHD = (FMS, HJG)
    NDF = (PLK, RTX)
    GMC = (PNT, HCX)
    GQX = (CPB, VNP)
    BXD = (VNL, MLC)
    DTD = (XLK, BVR)
    KQT = (MRH, SBD)
    QJH = (QMD, KBJ)
    NFJ = (MVL, SFT)
    JMH = (FVB, BMP)
    BVF = (SFB, KSS)
    RBF = (JCD, NDT)
    QBX = (KJV, LBX)
    NTG = (DPX, CBV)
    DRL = (XXM, PRQ)
    QNX = (SHD, LXG)
    PNN = (KQD, HMZ)
    CCS = (TQQ, DDP)
    QSD = (QTF, HTT)
    BVN = (JNK, TRT)
    HSF = (KNG, LXD)
    BHL = (DSB, SGB)
    VFX = (BHX, QNX)
    JFH = (TCH, DCB)
    DBV = (SDL, CDG)
    TRT = (RXN, BQX)
    VLC = (MHS, BCF)
    BBM = (HCB, FMB)
    THG = (THX, GFC)
    XKV = (HSG, MHM)
    DSB = (MKL, DVQ)
    XSC = (HVK, DRN)
    SKM = (VTJ, PLL)
    QFR = (KXP, QNS)
    BMP = (RFQ, LLH)
    MLM = (KRQ, CLV)
    XNH = (JJJ, DHC)
    KPM = (RBC, THN)
    FGX = (LNK, KQL)
    TSF = (BDD, KFL)
    LXG = (XCG, TRP)
    TBR = (HFK, LMB)
    JFK = (TQQ, DDP)
    TQH = (KJG, MQD)
    RKT = (FGX, XRG)
    DJF = (DJJ, LNQ)
    FPM = (LRR, HJP)
    PCJ = (XDX, NJD)
    HFK = (NQN, LQQ)
    SHB = (RMG, KJH)
    KPJ = (XVN, PGK)
    XSH = (LNH, VPT)
    SQX = (BVR, XLK)
    KTB = (QRS, KPF)
    RKK = (GLM, JQG)
    HTT = (TRV, FVH)
    SDL = (XKV, HMT)
    HCK = (FCK, QBJ)
    SJF = (JQV, JLB)
    QMT = (FPG, TBR)
    HGX = (QLS, XLB)
    VKM = (QFF, NLD)
    FNH = (KQV, RFD)
    HPM = (TRQ, QJS)
    PMS = (LHM, CJL)
    JTK = (XPG, XPG)
    VMN = (SJB, JCS)
    LNT = (SHM, NKV)
    KFL = (RCB, BVF)
    ZZZ = (NBP, TVT)
    QPX = (BFF, KNR)
    HSG = (LBC, RCN)
    SLV = (CFR, RXQ)
    KJH = (MHL, QNB)
    FCK = (DSS, DSS)
    RLL = (GBS, PGB)
    VKJ = (RFB, VLC)
    VSJ = (CGQ, KQT)
    XDX = (HPH, VFJ)
    LCB = (DGD, QRQ)
    PLL = (HFH, KXN)
    DMH = (BSR, FQV)
    PPQ = (XFP, LNT)
    PGB = (BRN, GXP)
    JMN = (DFT, DGR)
    RVT = (KTL, SFV)
    JCH = (SJB, JCS)
    KKG = (QPX, MLL)
    KNB = (CPB, VNP)
    HKM = (VFC, BXC)
    QBT = (CJL, LHM)
    GJM = (PQQ, BQT)
    RLN = (LDG, JJH)
    RJM = (JGN, FSL)
    LHL = (HSC, LBV)
    CVX = (VQT, XDS)
    LVV = (MGX, DGL)
    NSN = (JBX, GKM)
    MTL = (DPX, CBV)
    LBN = (NDG, HXX)
    KLG = (DBP, PCV)
    DGD = (MTL, NTG)
    LDG = (JTK, JTK)
    HCR = (GMR, PPQ)
    DMB = (SQT, VGH)
    LGK = (DBV, BSF)
    FLG = (FCK, FCK)
    KXL = (TXH, LQB)
    MQD = (JNF, LSR)
    RNC = (SMQ, FPM)
    QFF = (NTD, VCM)
    QLS = (DTK, CSG)
    JGH = (LJQ, NSJ)
    FSL = (BXD, TNN)
    KLC = (TBT, CVN)
    BDF = (KBK, NDR)
    QMD = (SXQ, BDF)
    VQT = (VBL, XHK)
    CSC = (NLG, FQP)
    SJB = (VGS, NSN)
    NFS = (DDR, LTK)
    DRA = (CJN, DRR)
    LBX = (THL, TKP)
    DJJ = (PLF, PLF)
    MJN = (TBX, DRB)
    TJP = (VKX, CTP)
    DDR = (RLL, HCL)
    LQB = (QBQ, NSF)
    BKV = (PSR, NKS)
    NKP = (XCH, XNH)
    VCX = (QSD, QSD)
    FQV = (HKH, VRD)
    VPH = (DDF, PLQ)
    HVS = (VPH, KGV)
    BHX = (LXG, SHD)
    RQV = (PHB, FDQ)
    NSL = (MCJ, DBM)
    GVD = (JBT, HKN)
    TRN = (QPX, MLL)
    XCG = (CXS, FVG)
    KBF = (XVR, TFT)
    CTD = (CJM, FTQ)
    PRH = (FVB, BMP)
    TLR = (NSL, XQF)
    BLS = (VVM, NFB)
    VVL = (MRB, NTX)
    QGV = (RFD, KQV)
    SRK = (GLM, JQG)
    VHX = (LQG, KRF)
    NHB = (PNG, NQL)
    LLK = (XDK, LLS)
    GQD = (TSX, KBF)
    LHV = (QRS, KPF)
    VNR = (PNG, NQL)
    LBP = (PCJ, MCK)
    TNN = (MLC, VNL)
    KNR = (PLM, DGC)
    BMD = (SJF, GTJ)
    FPG = (HFK, LMB)
    XFP = (SHM, NKV)
    RSN = (LFH, TVV)
    FGN = (DVR, GLV)
    JHX = (VFX, MXX)
    DDG = (NDG, HXX)
    NQS = (NFJ, VSV)
    MKD = (DTM, MLM)
    CQQ = (KTL, SFV)
    DGK = (FMB, HCB)
    NSJ = (NKK, DRL)
    JTS = (GTF, KBP)
    VDG = (MCK, PCJ)
    MGN = (PVK, KLC)
    LBC = (SRK, RKK)
    CJQ = (FLD, CSB)
    MKG = (MHB, QPK)
    XVR = (PCL, QDH)
    QBQ = (LRB, VSJ)
    FXM = (LGK, PSK)
    LMQ = (TLR, NPH)
    PKM = (VBC, XXR)
    VJV = (TBX, DRB)
    CCV = (JFH, QNK)
    DMT = (RHS, JNG)
    XHQ = (PGD, TCT)
    DFC = (VMN, JCH)
    JJJ = (FNH, QGV)
    JNG = (KBM, KLG)
    THX = (RSN, BHS)
    TKG = (CQQ, RVT)
    HPN = (PDH, KPJ)
    BGS = (PSP, CMD)
    BLH = (QJX, SGJ)
    PRP = (QPK, MHB)
    PMV = (HDD, RKT)
    TRV = (TFL, MDD)
    CJL = (FMV, FJQ)
    JCQ = (KXF, HGT)
    GRS = (RBR, QNR)
    SGJ = (DCH, XPJ)
    RTX = (RJR, JJF)
    AAA = (TVT, NBP)
    XDK = (SPG, BMD)
    FBF = (XCH, XNH)
    LHM = (FMV, FJQ)
    SQT = (FVT, MDT)
    XPG = (JTF, RNX)
    MGX = (JGQ, DHD)
    PHH = (QBT, PMS)
    VJL = (MKG, PRP)
    DCB = (FRB, TDN)
    PRM = (BHC, QJV)
    FRR = (RPF, CLG)
    PGF = (MQQ, TPG)
    NQL = (MGL, SCP)
    CSG = (RRT, BLS)
    NMK = (PSR, NKS)
    MRH = (MKD, DKP)
    SFV = (HCH, FGN)
    BDD = (BVF, RCB)
    MDD = (CJQ, DQV)
    TGR = (PQQ, PQQ)
    MDT = (VBV, LLK)
    XXR = (MLF, TCX)
    DVR = (CQD, NQS)
    SXQ = (NDR, KBK)
    KBP = (QTJ, ZZZ)
    VRD = (TJN, FGM)
    VNP = (GQD, MBH)
    KHM = (TMM, QGJ)
    JCD = (KPK, VJL)
    BXJ = (FVP, PMV)
    DFT = (MTT, JCG)
    JRL = (VPT, LNH)
    HCH = (DVR, GLV)
    FPB = (JXF, DNF)
    NDR = (VFP, BSC)
    MQQ = (NGM, XHQ)
    XBM = (GLR, SDR)
    KQL = (RVJ, VGN)
    FPH = (CRK, FSD)
    GDV = (TQH, VRC)
    LCM = (PMS, QBT)
    NTX = (HPM, PNJ)
    FDQ = (NXM, HVS)
    KTF = (VNR, NHB)
    GTJ = (JQV, JLB)
    XHH = (LTX, PHJ)
    QVX = (KBS, GDV)
    VGG = (KRS, TPX)
    PFM = (GTF, GTF)
    KSK = (KMV, CVX)
    RVL = (QMD, KBJ)
    KXF = (NFD, HBL)
    VCM = (QVX, RTD)
    MBH = (KBF, TSX)
    LNK = (VGN, RVJ)
    TVV = (MHT, VBM)
    FXF = (MSK, FDH)
    VKB = (NMK, BKV)
    VGH = (MDT, FVT)
    NLG = (LJK, MFN)
    DSS = (KQD, KQD)
    VRG = (PFM, PFM)
    TQQ = (GTH, HKM)
    RSH = (HCX, PNT)
    TKP = (KJP, GGM)
    VRC = (MQD, KJG)
    HJP = (KGF, SRS)
    PSP = (QRF, HFJ)
    NKK = (XXM, PRQ)
    JJF = (DNT, BNG)
    PLF = (RBR, RBR)
    NJD = (HPH, VFJ)
    RRV = (KNB, GQX)
    GLV = (CQD, NQS)
    XBR = (DMB, XRL)
    SPG = (SJF, GTJ)
    DKX = (FXF, BDC)
    FQH = (RQV, KLN)
    QBJ = (DSS, PNN)
    VVM = (MNG, CSC)
    KXQ = (XBG, GVD)
    CFK = (JGT, XTG)
    CMA = (LQP, XBV)
    FCS = (QFR, FHX)
    FFJ = (JNG, RHS)
    LMB = (NQN, LQQ)
    TMM = (RBF, KTS)
    JXH = (VRG, BRX)
    FBT = (VJV, MJN)
    QCN = (HPN, MKH)
    XDS = (XHK, VBL)
    QNK = (TCH, DCB)
    MKL = (KXQ, XSX)
    MLF = (SJL, JTQ)
    MGL = (TMX, DKX)
    MTT = (CFK, RPR)
    KRF = (QMT, HLR)
    BSR = (VRD, HKH)
    TJL = (QHV, XBR)
    PCV = (NMT, RMQ)
    FVP = (RKT, HDD)
    SHM = (DQJ, BHD)
    PNG = (SCP, MGL)
    PGD = (FCC, FPH)
    QJS = (GCG, GQF)
    CFP = (MRB, NTX)
    QGS = (RTX, PLK)
    SJL = (XSC, RKL)
    JST = (JFH, QNK)
    TBX = (VHX, MSM)
    DDZ = (PHQ, JBF)
    KXP = (XBM, GML)
    HKC = (NDF, QGS)
    DHF = (VQV, SDB)
    JXT = (BDD, KFL)
    LQG = (QMT, HLR)
    LXD = (RBH, CKT)
    LXM = (XPG, XKZ)
    XLV = (GXQ, VMX)
    GLL = (PVK, KLC)
    TSX = (XVR, TFT)
    QRF = (DJF, KJM)
    KJG = (JNF, LSR)
    GQB = (XSH, JRL)
    GKR = (LMD, KVB)
    GVS = (QJH, RVL)
    VPM = (XQJ, XTS)
    QNR = (LDC, DDZ)
    PVK = (TBT, CVN)
    JCX = (SNM, PLS)
    HHJ = (QFF, NLD)
    TLX = (VNN, RRV)
    GTF = (QTJ, QTJ)
    LNQ = (PLF, GRS)
    VBL = (GJK, BLQ)
    DGC = (DGK, BBM)
    NDT = (VJL, KPK)
    KBS = (VRC, TQH)
    RVJ = (TJP, VSF)
    RBR = (LDC, LDC)
    PDH = (XVN, XVN)
    JBF = (VSK, JMN)
    BBD = (MQR, JXH)
    FVT = (VBV, LLK)
    VBC = (MLF, TCX)
    XKZ = (RNX, JTF)
    MNA = (JTF, RNX)
    VFJ = (HHJ, VKM)
    GLM = (SKM, THM)
    JNF = (FFJ, DMT)
    MNG = (FQP, NLG)
    MVL = (PRM, KLH)
    RHS = (KBM, KLG)
    CRC = (CMQ, QCN)
    BPB = (DMH, NNT)
    NLD = (VCM, NTD)
    XCH = (JJJ, DHC)
    CKT = (PLR, KHM)
    NNT = (BSR, FQV)
    GQC = (XQS, QXL)
    GKM = (QTH, KHG)
    GJD = (TRB, MDB)
    CGB = (VXJ, VCG)
    SMQ = (HJP, LRR)
    RNP = (BLH, KHP)
    MMP = (NCM, XPK)
    VLX = (XQS, QXL)
    XJL = (BVN, KGN)
    LRB = (CGQ, KQT)
    NGM = (TCT, PGD)
    TBT = (KTB, LHV)
    JLB = (SGT, GMX)
    HFJ = (DJF, KJM)
    RCN = (RKK, SRK)
    KJM = (DJJ, LNQ)
    CVN = (KTB, LHV)
    PHB = (NXM, HVS)
    KJP = (HCR, QPM)
    SHD = (XCG, TRP)
    KKX = (LQP, XBV)
    FHX = (KXP, QNS)
    CLV = (MDF, RLN)
    FXV = (FQH, FCH)
    HTD = (TNQ, HSF)
    CJM = (LMQ, RLM)
    BSF = (CDG, SDL)
    JVN = (VMN, JCH)
    KDK = (XSG, LHL)
    FGM = (PJB, NTQ)
    MRB = (PNJ, HPM)
    JTQ = (XSC, RKL)
    CJN = (TSF, JXT)
    RLC = (QJH, RVL)
    XLK = (CBK, JBG)
    KLN = (FDQ, PHB)
    JJH = (JTK, LXM)
    TVT = (GKC, HKC)
    QHV = (DMB, XRL)
    TCX = (SJL, JTQ)
    JBX = (KHG, QTH)
    CQD = (NFJ, VSV)
    KPF = (VPM, FDD)
    KHG = (HCF, RNP)
    BSC = (QBX, JVB)
    KVK = (CQQ, RVT)
    CPB = (GQD, MBH)
    LTK = (RLL, HCL)
    HVK = (XMR, BJB)
    TFT = (QDH, PCL)
    MHB = (TDF, RCG)
    SRQ = (PMV, FVP)
    NJA = (QTF, HTT)
    RMN = (XHH, XNC)
    VCG = (VDG, LBP)
    LSF = (JMH, PRH)
    THL = (GGM, KJP)
    PLK = (RJR, JJF)
    DKP = (DTM, MLM)
    NQN = (LCM, PHH)
    KNG = (RBH, CKT)
    GKC = (NDF, QGS)
    BRF = (FPB, JFD)
    HKH = (FGM, TJN)
    KTL = (HCH, FGN)
    HKN = (MMP, BFV)
    JVB = (KJV, LBX)
    QVH = (LCB, NMB)
    HHF = (XQC, GSF)
    VGS = (JBX, GKM)
    BXC = (KPH, PKM)
    DBM = (FCS, BFJ)
    QPK = (TDF, RCG)
    VXJ = (LBP, VDG)
    GGM = (HCR, QPM)
    LHB = (LJQ, NSJ)
    LJQ = (NKK, DRL)
    JXF = (FLG, HCK)
    PHJ = (XFB, CGP)
    MKH = (PDH, KPJ)
    MFT = (PSK, LGK)
    CBS = (PCK, JXJ)
    FRK = (LTK, DDR)
    CMQ = (HPN, MKH)
    QJV = (RJM, SVN)
    KHP = (SGJ, QJX)
    CQR = (MGX, DGL)
    FJQ = (CQR, LVV)
    HCF = (KHP, BLH)
    LFC = (LMD, KVB)
    DPX = (CGB, PGV)
    DFS = (XLB, QLS)
    DDK = (GKR, LFC)
    KLS = (FPM, SMQ)
    JGQ = (RLC, GVS)
    LBV = (HHF, STJ)
    JGT = (TQJ, XBB)
    QRN = (LHL, XSG)
    RFD = (QRN, KDK)
    HSC = (STJ, HHF)
    LNH = (BRF, JPP)
    FSD = (TRN, KKG)
    NSF = (VSJ, LRB)
    QJF = (DSB, SGB)
    MQR = (VRG, BRX)
    XMR = (MVC, KXL)
    VNN = (KNB, GQX)
    NCM = (XLP, VKJ)
    KTS = (JCD, NDT)
    MDF = (LDG, LDG)
    PLS = (BGS, VVD)
    TPX = (TGR, GJM)
    GJK = (SQX, DTD)
    CTP = (BJL, GQB)
    GXP = (FXV, KQK)
    DRN = (BJB, XMR)
    QDH = (GNC, DDK)
    FMB = (JGH, LHB)
    STJ = (GSF, XQC)
    DNF = (FLG, HCK)
    XSR = (KXF, HGT)
    RNZ = (XBV, LQP)
    RGS = (MJC, LSF)
    GFC = (BHS, RSN)
    GTH = (BXC, VFC)
    PLM = (DGK, BBM)
    KSS = (HGX, DFS)
    SCP = (TMX, DKX)
    RXN = (GQC, VLX)
    PLR = (TMM, QGJ)
    QTH = (HCF, RNP)
    BRP = (CGG, JCX)
    BVR = (JBG, CBK)
    DTK = (BLS, RRT)
    TPB = (MQR, JXH)
    MJC = (PRH, JMH)
    GSF = (KPM, DRC)
    RVA = (JBF, PHQ)
    BLQ = (DTD, SQX)
    CBK = (BFN, SHB)
    VBM = (GMC, RSH)
    NFB = (CSC, MNG)
    NKS = (FPL, DHF)
    CLG = (KVK, TKG)
    KLH = (QJV, BHC)
    XQF = (DBM, MCJ)
    BCF = (KSK, BNM)
    XLP = (RFB, VLC)
    MVC = (TXH, LQB)
    LLS = (BMD, SPG)
    TJN = (PJB, NTQ)
    FQP = (LJK, MFN)
    PHQ = (VSK, JMN)
    XLB = (DTK, CSG)
    MHM = (RCN, LBC)
    LLH = (SRQ, BXJ)
    FVH = (MDD, TFL)
    RLM = (TLR, NPH)
    MLL = (BFF, KNR)
    CBP = (FBM, SLV)
    MHL = (TLX, VLF)
    MDB = (LSC, JHX)
    KQV = (QRN, KDK)
    SNM = (BGS, VVD)
    KGV = (PLQ, DDF)
    FCC = (FSD, CRK)
    JFD = (JXF, DNF)
    NTD = (RTD, QVX)
    TDF = (FXM, MFT)
    TMX = (BDC, FXF)
    MFN = (LBN, DDG)
    KGN = (TRT, JNK)
    XPK = (VKJ, XLP)
    JBT = (MMP, BFV)
    PLQ = (PSX, GHC)
    TRP = (CXS, FVG)
    QPM = (GMR, PPQ)
    VMX = (CBS, RJS)
    BFV = (XPK, NCM)
    LRR = (KGF, SRS)
    KGF = (MRL, VKB)
    PGV = (VCG, VXJ)
    LHX = (JVN, DFC)
    KPH = (VBC, XXR)
    GQF = (RHT, KTF)
    XQC = (KPM, DRC)
    TFV = (BVN, KGN)
    VVD = (CMD, PSP)
    HGT = (NFD, HBL)
    HBL = (MGN, GLL)
    XBG = (JBT, HKN)
    XSG = (LBV, HSC)
    SRS = (MRL, VKB)
    XBV = (NFS, FRK)
    PNJ = (TRQ, QJS)
    BRX = (PFM, JTS)
    GHC = (JPD, PDS)
    RCB = (KSS, SFB)
    QNS = (GML, XBM)
    GNC = (LFC, GKR)
    MRL = (BKV, NMK)
    KVB = (VGG, RHK)
    VCF = (JCX, CGG)
    VFP = (QBX, JVB)
    FLD = (QDQ, CBP)
    JBG = (SHB, BFN)
    BJL = (JRL, XSH)
    DBP = (RMQ, NMT)
    SFT = (PRM, KLH)
    CMD = (HFJ, QRF)
    """
}

enum ExecutionPart {
    case part1
    case part2
}
