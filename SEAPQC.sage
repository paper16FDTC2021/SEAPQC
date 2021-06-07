#This file is in leaky-LWE-Estimator-master\Sec6_applications

load("../framework/instance_gen.sage")
#-----------------DILITHIUM-----------------#

def estimateDilithium():
    q = 8380417
    
    print("Dilithium lvl 1")
    D_s1 = build_centered_binomial_law(2) 
    D_s2 = D_s1
    n = 1024
    m = 1024
    A, b, dbdd = initialize_from_LWE_instance(DBDD,n,q,m,D_s2,D_s1)
    beta, delta = dbdd.estimate_attack()
    
    print("Dilithium lvl 1 After attack")
    n = n - int(float(0.375*n)) #In CBD with delta = 2 -> 37,5% are 0
    m = m - int(float(0.375*m)) 
    D_s1 = {-2:1/10,-1:4/10,1:4/10,2:1/10} 
    D_s2 = D_s1
    A, b, dbdd = initialize_from_LWE_instance(DBDD,n,q,m,D_s2,D_s1)
    beta, delta = dbdd.estimate_attack()
    
    print("Dilithium lvl 2")
    D_s1 = build_centered_binomial_law(4)
    D_s2 = D_s1
    n = 1280
    m = 1536
    A, b, dbdd = initialize_from_LWE_instance(DBDD,n,q,m,D_s2,D_s1)
    beta, delta = dbdd.estimate_attack()
    
    print("Dilithium lvl 2 After attack")
    n = n - int(float(0.273*n)) #In CBD with delta = 4 -> 27,3% are 0
    m = m - int(float(0.273*m)) 
    D_s1 = {-4:1/186,-3:8/186,-2:28/186,-1:56/186,1:56/186,2:28/186,3:8/186,4:1/186}
    D_s2 = D_s1
    A, b, dbdd = initialize_from_LWE_instance(DBDD,n,q,m,D_s2,D_s1)
    beta, delta = dbdd.estimate_attack()
    
    print("Dilithium lvl 3")
    D_s1 = build_centered_binomial_law(2)
    D_s2 = D_s1
    n = 1792
    m = 2048
    A, b, dbdd = initialize_from_LWE_instance(DBDD,n,q,m,D_s2,D_s1)
    beta, delta = dbdd.estimate_attack()
    
    print("Dilithium lvl 3 After attack")
    n = n - int(float(0.375*n)) #In CBD with delta = 2 -> 37,5% are 0
    m = m - int(float(0.375*m)) 
    D_s1 = {-2:1/10,-1:4/10,1:4/10,2:1/10}  
    D_s2 = D_s1
    A, b, dbdd = initialize_from_LWE_instance(DBDD,n,q,m,D_s2,D_s1)
    beta, delta = dbdd.estimate_attack()
#-------------------SABER-------------------#
def estimateSaber():
    q = 2**13
    p = 2**10
    
    print("Saber lvl 1")
    D_s = build_centered_binomial_law(5) 
    n = 512
    m = 512
    A, b, dbdd = initialize_from_LWR_instance(DBDD,n,q,p,m,D_s)
    beta, delta = dbdd.estimate_attack()
    
    print("Saber lvl 1 After attack")
    nprime = n - int(float(0.246*n)) #In CBD with delta = 5 -> 24,6% are 0
    D_s = {-5:1/772,-4:10/772,-3:45/772,-2:120/772,-1:210/772,1:210/772,2:120/772,3:45/772,4:10/772,5:1/772}
    A, b, dbdd = initialize_from_LWR_instance(DBDD,nprime,q,p,m,D_s)
    beta, delta = dbdd.estimate_attack()
    
    print("Saber lvl 2")
    D_s = build_centered_binomial_law(4)
    n = 768
    m = 768
    A, b, dbdd = initialize_from_LWR_instance(DBDD,n,q,p,m,D_s)
    beta, delta = dbdd.estimate_attack()
    
    print("Saber lvl 2 After attack")
    nprime = n - int(float(0.273*n)) #In CBD with delta = 4 -> 27,3% are 0
    D_s = {-4:1/186,-3:8/186,-2:28/186,-1:56/186,1:56/186,2:28/186,3:8/186,4:1/186}
    A, b, dbdd = initialize_from_LWR_instance(DBDD,nprime,q,p,m,D_s)
    beta, delta = dbdd.estimate_attack()
    
    print("Saber lvl 3")
    D_s = build_centered_binomial_law(3) 
    n = 1024
    m = 1024
    A, b, dbdd = initialize_from_LWR_instance(DBDD,n,q,p,m,D_s)
    beta, delta = dbdd.estimate_attack()
    
    print("Saber lvl 3 After attack")
    nprime = n - int(float(0.3125*n)) #In CBD with delta = 3 -> 31,25% are 0
    D_s = {-3:1/44,-2:6/44,-1:15/44,1:15/44,2:6/44,3:1/44}
    A, b, dbdd = initialize_from_LWR_instance(DBDD,nprime,q,p,m,D_s)
    beta, delta = dbdd.estimate_attack()
   
    return
#-------------------NTRU--------------------#
def estimateNTRU():
    print("NTRU HPS lvl 1")
    q = 2048
    n = 509
    hamming_weight = (q / 16 - 1)
    Df = RR(1 / 3)
    Dg = RR(hamming_weight / n)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HPS lvl 1 After attack")
    n = n - int(0.3333*n)
    Df = RR(1/2)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HPS lvl 2")
    q = 2048
    n = 677
    hamming_weight = (q / 16 - 1)
    Df = RR(1 / 3)
    Dg = RR(hamming_weight / n)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HPS lvl 2 After attack")
    n = n - int(0.3333*n)
    Df = RR(1/2)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HPS lvl 3")
    q = 4096
    n = 821
    hamming_weight = (q / 16 - 1)
    Df = RR(1 / 3)
    Dg = RR(hamming_weight / n)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HPS lvl 3 After attack")
    n = n - int(0.3333*n)
    Df = RR(1/2)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HRSS")
    q = 8192
    n = 701
    Df = RR(1 / 3)
    Dg = RR(1 / 3)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    
    print("NTRU HRSS After attack")
    n = 701 - int(0.3333*n)
    Df = RR(1 / 2)
    A, b, dbdd = initialize_NTRU_instance(DBDD_predict_diag, n, q, Df, Dg)
    beta, delta = dbdd.estimate_attack()
    return

estimateSaber()
estimateNTRU()
estimateDilithium()
